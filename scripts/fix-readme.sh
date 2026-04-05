#!/usr/bin/env bash
set -euo pipefail

#
# Post-generation fix: reorder "Available Resources and Operations" in README.md
# to match the tag order from the OpenAPI schema.
#
# Reads the schema URL from .speakeasy/workflow.yaml automatically.
# Drop this script into any Speakeasy SDK repo and add to prebuild/Makefile.
#
# Usage: bash scripts/fix-readme.sh
#

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
README="$ROOT/README.md"
WORKFLOW="$ROOT/.speakeasy/workflow.yaml"

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

# 1. Get schema URL from workflow.yaml (first location under inputs)
SCHEMA_URL=$(awk '/inputs:/{found=1; next} found && /location:/{print $NF; exit}' "$WORKFLOW")
if [[ -z "$SCHEMA_URL" ]]; then
  echo "Error: Could not find schema URL in $WORKFLOW" >&2
  exit 1
fi
echo "Schema: $SCHEMA_URL"

# 2. Download schema
curl -s "$SCHEMA_URL" -o "$TMPDIR/schema.yml" || true
if [[ ! -s "$TMPDIR/schema.yml" ]]; then
  echo "Error: Failed to download schema" >&2
  exit 1
fi

# 3. Extract tag names in schema order
TAGS=$(awk '
  /^tags:/ { in_tags=1; next }
  in_tags && /^[^ ]/ { exit }
  in_tags && /- name:/ { sub(/.*- name:[ ]*/, ""); gsub(/[ ]+/, ""); print }
' "$TMPDIR/schema.yml")

if [[ -z "$TAGS" ]]; then
  echo "Error: No tags found in schema" >&2
  exit 1
fi
echo "Tags: $(echo "$TAGS" | tr '\n' ',' | sed 's/,$//')"

# 4. Find operations section boundaries
START_LINE=$(grep -nm 1 'Start Available Resources and Operations' "$README" | cut -d: -f1)
END_LINE=$(grep -nm 1 'End Available Resources and Operations' "$README" | cut -d: -f1)
if [[ -z "$START_LINE" || -z "$END_LINE" ]]; then
  echo "Operations section not found, skipping."
  exit 0
fi

# 5. Split resource blocks into files keyed by name
sed -n "${START_LINE},${END_LINE}p" "$README" > "$TMPDIR/section"
ORIGINAL_LINES=$(wc -l < "$TMPDIR/section" | tr -d ' ')

# Extract header (everything before first ### [)
HEADER_END=$(grep -nm 1 '^### \[' "$TMPDIR/section" | cut -d: -f1)
head -n $((HEADER_END - 1)) "$TMPDIR/section" > "$TMPDIR/header"

# Split blocks on ### [ boundaries, stop at </details>
awk -v dir="$TMPDIR/blocks" '
  BEGIN { system("mkdir -p " dir) }
  /^<\/details>/ || /^<!-- End/ { name = ""; next }
  /^### \[/ {
    name = $0
    gsub(/^### \[/, "", name)
    gsub(/\].*/, "", name)
    file = dir "/" name
  }
  name { print >> file }
' "$TMPDIR/section"

# Validate: block count must match the number of ### [ headings in the original
EXPECTED_BLOCKS=$(grep -c '^### \[' "$TMPDIR/section")
ACTUAL_BLOCKS=$(ls "$TMPDIR/blocks" 2>/dev/null | wc -l | tr -d ' ')
if [[ "$ACTUAL_BLOCKS" -ne "$EXPECTED_BLOCKS" ]]; then
  echo "Error: Expected $EXPECTED_BLOCKS resource blocks but split into $ACTUAL_BLOCKS" >&2
  exit 1
fi

# 6. Check current vs desired order
CURRENT_ORDER=$(grep '^### \[' "$TMPDIR/section" | sed 's/^### \[\([A-Za-z]*\)\].*/\1/' | tr '\n' ',' | sed 's/,$//')

ORDERED=""
for tag in $TAGS; do
  if [[ -f "$TMPDIR/blocks/$tag" ]]; then
    ORDERED="${ORDERED:+$ORDERED }$tag"
  fi
done
for f in "$TMPDIR/blocks"/*; do
  [[ -f "$f" ]] || continue
  name=$(basename "$f")
  echo "$ORDERED" | grep -qw "$name" || ORDERED="${ORDERED:+$ORDERED }$name"
done

NEW_ORDER=$(echo "$ORDERED" | tr ' ' ',')
if [[ "$CURRENT_ORDER" == "$NEW_ORDER" ]]; then
  echo "Already in schema order."
  exit 0
fi

echo "Reorder operations:"
echo "  Before: $CURRENT_ORDER"
echo "  After:  $NEW_ORDER"

# 7. Reassemble
{
  cat "$TMPDIR/header"
  for tag in $ORDERED; do
    cat "$TMPDIR/blocks/$tag"
  done
  echo "</details>"
  echo "<!-- End Available Resources and Operations [operations] -->"
} > "$TMPDIR/new_section"

# Validate: new section should have the same number of ### [ headings
NEW_BLOCKS=$(grep -c '^### \[' "$TMPDIR/new_section")
if [[ "$NEW_BLOCKS" -ne "$EXPECTED_BLOCKS" ]]; then
  echo "Error: Reassembled section has $NEW_BLOCKS blocks, expected $EXPECTED_BLOCKS" >&2
  exit 1
fi

# Validate: new section line count should be close to original (±5 for marker lines)
NEW_LINES=$(wc -l < "$TMPDIR/new_section" | tr -d ' ')
DIFF=$(( NEW_LINES - ORIGINAL_LINES ))
if [[ "${DIFF#-}" -gt 5 ]]; then
  echo "Error: Line count mismatch — original: $ORIGINAL_LINES, new: $NEW_LINES (diff: $DIFF)" >&2
  exit 1
fi

# 8. Replace in README
{
  head -n $((START_LINE - 1)) "$README"
  cat "$TMPDIR/new_section"
  tail -n +$((END_LINE + 1)) "$README"
} > "$TMPDIR/new_readme"

# Validate: final README should not be empty or drastically different in size
ORIGINAL_SIZE=$(wc -l < "$README" | tr -d ' ')
NEW_SIZE=$(wc -l < "$TMPDIR/new_readme" | tr -d ' ')
SIZE_DIFF=$(( NEW_SIZE - ORIGINAL_SIZE ))
if [[ "$NEW_SIZE" -lt 10 ]] || [[ "${SIZE_DIFF#-}" -gt 10 ]]; then
  echo "Error: Output README looks wrong — original: $ORIGINAL_SIZE lines, new: $NEW_SIZE lines" >&2
  exit 1
fi

cp "$TMPDIR/new_readme" "$README"
echo "README.md updated."

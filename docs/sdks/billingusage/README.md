# BillingUsage

## Overview

### Available Operations

* [get](#get) - Get billing usage information

## get

Retrieve billing usage metrics for your account and product environments,
including storage, bandwidth, impressions, and transformations.

If `year` is provided:
  - **Annual subscription**: Returns the single annual usage cycle that began in the specified year (if any).
  - **Monthly subscription**: Returns all monthly usage cycles that began in the specified year.

If `year` is not provided:
  - Returns usage for the year in which the current active subscription period began.
  - If no active subscription exists, an empty list is returned.

**Note**: Usage metrics are updated daily, so calling this endpoint once per day gives you the latest data.


### Example Usage: AdvancedExtraPAYG

<!-- UsageSnippet language="python" operationID="getBillingUsage" method="get" path="/v1_1/provisioning/accounts/{account_id}/billing_usage" example="AdvancedExtraPAYG" -->
```python
import cloudinary_account_provisioning
from cloudinary_account_provisioning import CldProvisioning


with CldProvisioning(
    account_id="<id>",
    security=cloudinary_account_provisioning.Security(
        provisioning_api_key="CLOUDINARY_PROVISIONING_API_KEY",
        provisioning_api_secret="CLOUDINARY_PROVISIONING_API_SECRET",
    ),
) as cld_provisioning:

    res = cld_provisioning.billing_usage.get(year=2024)

    # Handle response
    print(res)

```
### Example Usage: AdvancedPAYG

<!-- UsageSnippet language="python" operationID="getBillingUsage" method="get" path="/v1_1/provisioning/accounts/{account_id}/billing_usage" example="AdvancedPAYG" -->
```python
import cloudinary_account_provisioning
from cloudinary_account_provisioning import CldProvisioning


with CldProvisioning(
    account_id="<id>",
    security=cloudinary_account_provisioning.Security(
        provisioning_api_key="CLOUDINARY_PROVISIONING_API_KEY",
        provisioning_api_secret="CLOUDINARY_PROVISIONING_API_SECRET",
    ),
) as cld_provisioning:

    res = cld_provisioning.billing_usage.get(year=2024)

    # Handle response
    print(res)

```
### Example Usage: MultiPlan

<!-- UsageSnippet language="python" operationID="getBillingUsage" method="get" path="/v1_1/provisioning/accounts/{account_id}/billing_usage" example="MultiPlan" -->
```python
import cloudinary_account_provisioning
from cloudinary_account_provisioning import CldProvisioning


with CldProvisioning(
    account_id="<id>",
    security=cloudinary_account_provisioning.Security(
        provisioning_api_key="CLOUDINARY_PROVISIONING_API_KEY",
        provisioning_api_secret="CLOUDINARY_PROVISIONING_API_SECRET",
    ),
) as cld_provisioning:

    res = cld_provisioning.billing_usage.get(year=2024)

    # Handle response
    print(res)

```
### Example Usage: ProPAYG

<!-- UsageSnippet language="python" operationID="getBillingUsage" method="get" path="/v1_1/provisioning/accounts/{account_id}/billing_usage" example="ProPAYG" -->
```python
import cloudinary_account_provisioning
from cloudinary_account_provisioning import CldProvisioning


with CldProvisioning(
    account_id="<id>",
    security=cloudinary_account_provisioning.Security(
        provisioning_api_key="CLOUDINARY_PROVISIONING_API_KEY",
        provisioning_api_secret="CLOUDINARY_PROVISIONING_API_SECRET",
    ),
) as cld_provisioning:

    res = cld_provisioning.billing_usage.get(year=2024)

    # Handle response
    print(res)

```
### Example Usage: ProPAYGPlus

<!-- UsageSnippet language="python" operationID="getBillingUsage" method="get" path="/v1_1/provisioning/accounts/{account_id}/billing_usage" example="ProPAYGPlus" -->
```python
import cloudinary_account_provisioning
from cloudinary_account_provisioning import CldProvisioning


with CldProvisioning(
    account_id="<id>",
    security=cloudinary_account_provisioning.Security(
        provisioning_api_key="CLOUDINARY_PROVISIONING_API_KEY",
        provisioning_api_secret="CLOUDINARY_PROVISIONING_API_SECRET",
    ),
) as cld_provisioning:

    res = cld_provisioning.billing_usage.get(year=2024)

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                  | Type                                                                                       | Required                                                                                   | Description                                                                                | Example                                                                                    |
| ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ |
| `year`                                                                                     | *Optional[int]*                                                                            | :heavy_minus_sign:                                                                         | The year to retrieve billing usage for. Behavior depends on subscription type (see above). | 2024                                                                                       |
| `include_prodenv_breakdown`                                                                | *Optional[bool]*                                                                           | :heavy_minus_sign:                                                                         | Whether to include usage details by product environment. **Default**: false.<br/>          |                                                                                            |
| `retries`                                                                                  | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                           | :heavy_minus_sign:                                                                         | Configuration to override the default retry behavior of the client.                        |                                                                                            |

### Response

**[List[models.BillingUsageResponse]](../../models/.md)**

### Errors

| Error Type              | Status Code             | Content Type            |
| ----------------------- | ----------------------- | ----------------------- |
| models.ErrorResponse    | 400, 401, 403, 404, 429 | application/json        |
| models.APIError         | 4XX, 5XX                | \*/\*                   |
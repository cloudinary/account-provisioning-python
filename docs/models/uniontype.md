# UnionType

Whether to return users who last logged in within the specified date range (include) or those who didn't
last log in within the range (exclude). **Possible values**: `include`, `exclude`. **Default**: `include`.


## Example Usage

```python
from cloudinary_account_provisioning.models import UnionType

value = UnionType.INCLUDE
```


## Values

| Name      | Value     |
| --------- | --------- |
| `INCLUDE` | include   |
| `EXCLUDE` | exclude   |
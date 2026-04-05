# ScopeTypeEnum

Specifies where the role/policy is applied, either at the account level or within product environments.

## Example Usage

```python
from cloudinary_account_provisioning.models import ScopeTypeEnum

value = ScopeTypeEnum.ACCOUNT

# Open enum: unrecognized values are captured as UnrecognizedStr
```


## Values

| Name      | Value     |
| --------- | --------- |
| `ACCOUNT` | account   |
| `PRODENV` | prodenv   |
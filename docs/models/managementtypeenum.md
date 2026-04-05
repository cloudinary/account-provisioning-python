# ManagementTypeEnum

Specifies whether the role's policies are managed by Cloudinary (`system`) or by the user (`custom`).

## Example Usage

```python
from cloudinary_account_provisioning.models import ManagementTypeEnum

value = ManagementTypeEnum.SYSTEM

# Open enum: unrecognized values are captured as UnrecognizedStr
```


## Values

| Name     | Value    |
| -------- | -------- |
| `SYSTEM` | system   |
| `CUSTOM` | custom   |
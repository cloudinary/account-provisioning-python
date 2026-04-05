# PrincipalTypeEnum

The type of principal.

## Example Usage

```python
from cloudinary_account_provisioning.models import PrincipalTypeEnum

value = PrincipalTypeEnum.USER

# Open enum: unrecognized values are captured as UnrecognizedStr
```


## Values

| Name               | Value              |
| ------------------ | ------------------ |
| `USER`             | user               |
| `GROUP`            | group              |
| `API_KEY`          | apiKey             |
| `PROVISIONING_KEY` | provisioningKey    |
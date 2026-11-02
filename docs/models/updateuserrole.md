# ~~UpdateUserRole~~

The legacy role to assign. Deprecated: use `roles` (create) or `role_management` (update) instead. Can't be combined with `roles` or `role_management`.

> :warning: **DEPRECATED**: Use `roles` (create) or `role_management` (update) instead..

## Example Usage

```python
from cloudinary_account_provisioning.models import UpdateUserRole

value = UpdateUserRole.MASTER_ADMIN
```


## Values

| Name                  | Value                 |
| --------------------- | --------------------- |
| `MASTER_ADMIN`        | master_admin          |
| `ADMIN`               | admin                 |
| `BILLING`             | billing               |
| `TECHNICAL_ADMIN`     | technical_admin       |
| `REPORTS`             | reports               |
| `MEDIA_LIBRARY_ADMIN` | media_library_admin   |
| `MEDIA_LIBRARY_USER`  | media_library_user    |
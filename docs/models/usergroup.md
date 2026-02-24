# UserGroup

User group.


## Fields

| Field                                                                              | Type                                                                               | Required                                                                           | Description                                                                        |
| ---------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| `id`                                                                               | *Optional[str]*                                                                    | :heavy_minus_sign:                                                                 | The user group's ID.                                                               |
| `name`                                                                             | *Optional[str]*                                                                    | :heavy_minus_sign:                                                                 | The user group's name.                                                             |
| `users`                                                                            | List[[models.UserGroupUser](../models/usergroupuser.md)]                           | :heavy_minus_sign:                                                                 | A list of user group users.<br/>Only returned in extended_details.<br/>            |
| `created_at`                                                                       | [date](https://docs.python.org/3/library/datetime.html#date-objects)               | :heavy_minus_sign:                                                                 | The date when the user group was created.<br/>Only returned in extended_details.<br/> |
| `updated_at`                                                                       | [date](https://docs.python.org/3/library/datetime.html#date-objects)               | :heavy_minus_sign:                                                                 | The date when the user group was last updated.<br/>Only returned in extended_details.<br/> |
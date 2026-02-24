# AccessKey


## Fields

| Field                                                                | Type                                                                 | Required                                                             | Description                                                          |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `name`                                                               | *Optional[str]*                                                      | :heavy_minus_sign:                                                   | The name of the access key.                                          |
| `api_key`                                                            | *Optional[str]*                                                      | :heavy_minus_sign:                                                   | The API key.                                                         |
| `api_secret`                                                         | *Optional[str]*                                                      | :heavy_minus_sign:                                                   | The API secret.                                                      |
| `created_at`                                                         | [date](https://docs.python.org/3/library/datetime.html#date-objects) | :heavy_minus_sign:                                                   | The date when the access key was created.                            |
| `updated_at`                                                         | [date](https://docs.python.org/3/library/datetime.html#date-objects) | :heavy_minus_sign:                                                   | The date when the access key was last updated.                       |
| `enabled`                                                            | *Optional[bool]*                                                     | :heavy_minus_sign:                                                   | Whether the access key is enabled or disabled.                       |
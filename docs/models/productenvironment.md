# ProductEnvironment

Product Environment


## Fields

| Field                                                                | Type                                                                 | Required                                                             | Description                                                          |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `cloud_name`                                                         | *Optional[str]*                                                      | :heavy_minus_sign:                                                   | N/A                                                                  |
| `name`                                                               | *Optional[str]*                                                      | :heavy_minus_sign:                                                   | The cloud name of the product environment.                           |
| `enabled`                                                            | *Optional[bool]*                                                     | :heavy_minus_sign:                                                   | Whether the product environment is enabled or disabled.              |
| `id`                                                                 | *Optional[str]*                                                      | :heavy_minus_sign:                                                   | The ID of the product environment.                                   |
| `api_access_keys`                                                    | List[[models.APIAccessKey](../models/apiaccesskey.md)]               | :heavy_minus_sign:                                                   | The list of the product environment's access keys.                   |
| `created_at`                                                         | [date](https://docs.python.org/3/library/datetime.html#date-objects) | :heavy_minus_sign:                                                   | The date when the product environment was created.                   |
| `updated_at`                                                         | [date](https://docs.python.org/3/library/datetime.html#date-objects) | :heavy_minus_sign:                                                   | The date when the product environment was last updated.              |
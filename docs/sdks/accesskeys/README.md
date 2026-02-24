# AccessKeys

## Overview

### Available Operations

* [list](#list) - Get access keys
* [generate](#generate) - Generate an access key
* [delete_by_name](#delete_by_name) - Delete access key by name
* [update](#update) - Update an access key
* [delete](#delete) - Delete access key

## list

Retrieve an array of all access keys for a product environment.

Learn more about retrieving access keys.
<https://cloudinary.com/documentation/provisioning_api#get_access_keys>

### Example Usage

<!-- UsageSnippet language="python" operationID="getAccessKeys" method="get" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts/{sub_account_id}/access_keys" example="AccessKeys" -->
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

    res = cld_provisioning.access_keys.list(request={
        "sub_account_id": "abcde1fghij2klmno3pqrst4uvwxy5z",
        "sort_by": cloudinary_account_provisioning.SortBy.CREATED_AT,
        "sort_order": cloudinary_account_provisioning.SortOrder.ASC,
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `request`                                                           | [models.GetAccessKeysRequest](../../models/getaccesskeysrequest.md) | :heavy_check_mark:                                                  | The request object to use for the request.                          |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.AccessKeysResponse](../../models/accesskeysresponse.md)**

### Errors

| Error Type           | Status Code          | Content Type         |
| -------------------- | -------------------- | -------------------- |
| models.ErrorResponse | 401, 404, 420, 429   | application/json     |
| models.APIError      | 4XX, 5XX             | \*/\*                |

## generate

Generate a new access key.

Learn more about generating access keys.
<https://cloudinary.com/documentation/provisioning_api#generate_an_access_key>

### Example Usage

<!-- UsageSnippet language="python" operationID="generateAccessKey" method="post" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts/{sub_account_id}/access_keys" example="MainAccessKey" -->
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

    res = cld_provisioning.access_keys.generate(sub_account_id="abcde1fghij2klmno3pqrst4uvwxy5z", access_key_request={
        "name": "main_key",
        "enabled": True,
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `sub_account_id`                                                    | *str*                                                               | :heavy_check_mark:                                                  | The ID of the product environment.                                  | abcde1fghij2klmno3pqrst4uvwxy5z                                     |
| `access_key_request`                                                | [models.AccessKeyRequest](../../models/accesskeyrequest.md)         | :heavy_check_mark:                                                  | Access key details.                                                 |                                                                     |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.AccessKey](../../models/accesskey.md)**

### Errors

| Error Type                        | Status Code                       | Content Type                      |
| --------------------------------- | --------------------------------- | --------------------------------- |
| models.ErrorResponse              | 400, 401, 403, 404, 409, 420, 429 | application/json                  |
| models.APIError                   | 4XX, 5XX                          | \*/\*                             |

## delete_by_name

Delete a specific access key by name.

Learn more about deleting access keys.
<https://cloudinary.com/documentation/provisioning_api#delete_an_access_key>

### Example Usage

<!-- UsageSnippet language="python" operationID="deleteAccessKeyByName" method="delete" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts/{sub_account_id}/access_keys" -->
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

    res = cld_provisioning.access_keys.delete_by_name(sub_account_id="abcde1fghij2klmno3pqrst4uvwxy5z", name="main_key")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `sub_account_id`                                                    | *str*                                                               | :heavy_check_mark:                                                  | The ID of the product environment.                                  | abcde1fghij2klmno3pqrst4uvwxy5z                                     |
| `name`                                                              | *str*                                                               | :heavy_check_mark:                                                  | The access key name.                                                | main_key                                                            |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.SuccessResponse](../../models/successresponse.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| models.ErrorResponse         | 400, 401, 403, 404, 420, 429 | application/json             |
| models.APIError              | 4XX, 5XX                     | \*/\*                        |

## update

Update the name and/or status of an existing access key.

Learn more about updating access keys.
<https://cloudinary.com/documentation/provisioning_api#update_an_access_key>

### Example Usage

<!-- UsageSnippet language="python" operationID="updateAccessKey" method="put" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts/{sub_account_id}/access_keys/{key}" example="MainAccessKey" -->
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

    res = cld_provisioning.access_keys.update(sub_account_id="abcde1fghij2klmno3pqrst4uvwxy5z", key="814814814814814", access_key_update_request={
        "name": "main_key",
        "enabled": True,
        "dedicated_for": cloudinary_account_provisioning.DedicatedFor.WEBHOOKS,
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                               | Type                                                                    | Required                                                                | Description                                                             | Example                                                                 |
| ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `sub_account_id`                                                        | *str*                                                                   | :heavy_check_mark:                                                      | The ID of the product environment.                                      | abcde1fghij2klmno3pqrst4uvwxy5z                                         |
| `key`                                                                   | *str*                                                                   | :heavy_check_mark:                                                      | The access key (api key).                                               | 814814814814814                                                         |
| `access_key_update_request`                                             | [models.AccessKeyUpdateRequest](../../models/accesskeyupdaterequest.md) | :heavy_check_mark:                                                      | Access key details for update.                                          |                                                                         |
| `retries`                                                               | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)        | :heavy_minus_sign:                                                      | Configuration to override the default retry behavior of the client.     |                                                                         |

### Response

**[models.AccessKey](../../models/accesskey.md)**

### Errors

| Error Type                        | Status Code                       | Content Type                      |
| --------------------------------- | --------------------------------- | --------------------------------- |
| models.ErrorResponse              | 400, 401, 403, 404, 409, 420, 429 | application/json                  |
| models.APIError                   | 4XX, 5XX                          | \*/\*                             |

## delete

Delete a specific access key.

Learn more about deleting access keys.
<https://cloudinary.com/documentation/provisioning_api#delete_an_access_key>

### Example Usage

<!-- UsageSnippet language="python" operationID="deleteAccessKey" method="delete" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts/{sub_account_id}/access_keys/{key}" -->
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

    res = cld_provisioning.access_keys.delete(sub_account_id="abcde1fghij2klmno3pqrst4uvwxy5z", key="814814814814814")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `sub_account_id`                                                    | *str*                                                               | :heavy_check_mark:                                                  | The ID of the product environment.                                  | abcde1fghij2klmno3pqrst4uvwxy5z                                     |
| `key`                                                               | *str*                                                               | :heavy_check_mark:                                                  | The access key (api key).                                           | 814814814814814                                                     |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.SuccessResponse](../../models/successresponse.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| models.ErrorResponse         | 400, 401, 403, 404, 420, 429 | application/json             |
| models.APIError              | 4XX, 5XX                     | \*/\*                        |
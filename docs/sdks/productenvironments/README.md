# ProductEnvironments

## Overview

### Available Operations

* [list](#list) - Get product environments
* [create](#create) - Create product environment
* [get](#get) - Get product environment
* [update](#update) - Update product environment
* [delete](#delete) - Delete product environment

## list

Return an array of all product environments, or if conditions are specified,
return the relevant product environments.


Learn more about getting product environments.
<https://cloudinary.com/documentation/provisioning_api#get_product_environments>

### Example Usage

<!-- UsageSnippet language="python" operationID="getProductEnvironments" method="get" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts" example="ProductEnvironments" -->
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

    res = cld_provisioning.product_environments.list(enabled=True, prefix="product")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                             | Type                                                                                                                                                                                  | Required                                                                                                                                                                              | Description                                                                                                                                                                           | Example                                                                                                                                                                               |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `enabled`                                                                                                                                                                             | *Optional[bool]*                                                                                                                                                                      | :heavy_minus_sign:                                                                                                                                                                    | Whether to only return enabled product environments (true) or disabled product environments (false).<br/>**Default**: all product environments are returned (both enabled and disabled).<br/> | true                                                                                                                                                                                  |
| `ids`                                                                                                                                                                                 | List[*str*]                                                                                                                                                                           | :heavy_minus_sign:                                                                                                                                                                    | A list of up to 100 product environment IDs. When provided, other parameters are ignored.                                                                                             |                                                                                                                                                                                       |
| `cloud_names`                                                                                                                                                                         | List[*str*]                                                                                                                                                                           | :heavy_minus_sign:                                                                                                                                                                    | A list of up to 100 product environment cloud names.                                                                                                                                  |                                                                                                                                                                                       |
| `prefix`                                                                                                                                                                              | *Optional[str]*                                                                                                                                                                       | :heavy_minus_sign:                                                                                                                                                                    | Returns product environments where the name begins with the specified case-insensitive string.                                                                                        | product                                                                                                                                                                               |
| `retries`                                                                                                                                                                             | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                      | :heavy_minus_sign:                                                                                                                                                                    | Configuration to override the default retry behavior of the client.                                                                                                                   |                                                                                                                                                                                       |

### Response

**[models.ProductEnvironmentsResponse](../../models/productenvironmentsresponse.md)**

### Errors

| Error Type                        | Status Code                       | Content Type                      |
| --------------------------------- | --------------------------------- | --------------------------------- |
| models.ErrorResponse              | 400, 401, 403, 404, 409, 420, 429 | application/json                  |
| models.APIError                   | 4XX, 5XX                          | \*/\*                             |

## create

Create a new product environment. Any users that have access to all product environments will also automatically
have access to the new product environment.


Learn more about creating product environments.
<https://cloudinary.com/documentation/provisioning_api#create_product_environment>

### Example Usage

<!-- UsageSnippet language="python" operationID="createProductEnvironment" method="post" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts" example="ProductEnvironment3" -->
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

    res = cld_provisioning.product_environments.create(request={
        "name": "Product3 Application",
        "cloud_name": "product3",
        "base_sub_account_id": "0aaaaa1bbbbb2ccccc3ddddd4eeeee5f",
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                     | Type                                                                          | Required                                                                      | Description                                                                   |
| ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| `request`                                                                     | [models.ProductEnvironmentRequest](../../models/productenvironmentrequest.md) | :heavy_check_mark:                                                            | The request object to use for the request.                                    |
| `retries`                                                                     | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)              | :heavy_minus_sign:                                                            | Configuration to override the default retry behavior of the client.           |

### Response

**[models.ProductEnvironment](../../models/productenvironment.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| models.ErrorResponse         | 400, 401, 403, 409, 420, 429 | application/json             |
| models.APIError              | 4XX, 5XX                     | \*/\*                        |

## get

Retrieve a specific product environment.

Learn more about retrieving specific product environments.
<https://cloudinary.com/documentation/provisioning_api#get_product_environment>

### Example Usage: ProductEnvironment1

<!-- UsageSnippet language="python" operationID="getProductEnvironment" method="get" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts/{sub_account_id}" example="ProductEnvironment1" -->
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

    res = cld_provisioning.product_environments.get(sub_account_id="abcde1fghij2klmno3pqrst4uvwxy5z")

    # Handle response
    print(res)

```
### Example Usage: ProductEnvironment2

<!-- UsageSnippet language="python" operationID="getProductEnvironment" method="get" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts/{sub_account_id}" example="ProductEnvironment2" -->
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

    res = cld_provisioning.product_environments.get(sub_account_id="abcde1fghij2klmno3pqrst4uvwxy5z")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `sub_account_id`                                                    | *str*                                                               | :heavy_check_mark:                                                  | The ID of the product environment.                                  | abcde1fghij2klmno3pqrst4uvwxy5z                                     |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.ProductEnvironment](../../models/productenvironment.md)**

### Errors

| Error Type              | Status Code             | Content Type            |
| ----------------------- | ----------------------- | ----------------------- |
| models.ErrorResponse    | 400, 401, 404, 420, 429 | application/json        |
| models.APIError         | 4XX, 5XX                | \*/\*                   |

## update

Update the details of a product environment.

Learn more about updating product environments.
<https://cloudinary.com/documentation/provisioning_api#update_product_environment>

### Example Usage

<!-- UsageSnippet language="python" operationID="updateProductEnvironment" method="put" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts/{sub_account_id}" example="ProductEnvironment1" -->
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

    res = cld_provisioning.product_environments.update(sub_account_id="abcde1fghij2klmno3pqrst4uvwxy5z", product_environment_update_request={
        "name": "Product3 Application",
        "cloud_name": "product3",
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                 | Type                                                                                      | Required                                                                                  | Description                                                                               | Example                                                                                   |
| ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `sub_account_id`                                                                          | *str*                                                                                     | :heavy_check_mark:                                                                        | The ID of the product environment.                                                        | abcde1fghij2klmno3pqrst4uvwxy5z                                                           |
| `product_environment_update_request`                                                      | [models.ProductEnvironmentUpdateRequest](../../models/productenvironmentupdaterequest.md) | :heavy_check_mark:                                                                        | Product environment details to update.                                                    |                                                                                           |
| `retries`                                                                                 | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                          | :heavy_minus_sign:                                                                        | Configuration to override the default retry behavior of the client.                       |                                                                                           |

### Response

**[models.ProductEnvironment](../../models/productenvironment.md)**

### Errors

| Error Type                        | Status Code                       | Content Type                      |
| --------------------------------- | --------------------------------- | --------------------------------- |
| models.ErrorResponse              | 400, 401, 403, 404, 409, 420, 429 | application/json                  |
| models.APIError                   | 4XX, 5XX                          | \*/\*                             |

## delete

Delete a specific product environment.

Learn more about deleting product environments.
<https://cloudinary.com/documentation/provisioning_api#delete_product_environment>

### Example Usage

<!-- UsageSnippet language="python" operationID="deleteProductEnvironment" method="delete" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts/{sub_account_id}" -->
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

    res = cld_provisioning.product_environments.delete(sub_account_id="abcde1fghij2klmno3pqrst4uvwxy5z")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `sub_account_id`                                                    | *str*                                                               | :heavy_check_mark:                                                  | The ID of the product environment.                                  | abcde1fghij2klmno3pqrst4uvwxy5z                                     |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.SuccessResponse](../../models/successresponse.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| models.ErrorResponse         | 400, 401, 403, 404, 420, 429 | application/json             |
| models.APIError              | 4XX, 5XX                     | \*/\*                        |
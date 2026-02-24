# Principals

## Overview

View roles associated with a specified principal, and add or remove a role associated with a principal.


### Available Operations

* [list_roles](#list_roles) - Get a principal's roles
* [update_roles](#update_roles) - Assign roles to a principal
* [inspect](#inspect) - Inspect
* [inspect_multiple](#inspect_multiple) - Inspect multiple

## list_roles

Retrieve all roles associated with a specific principal.

### Example Usage: GetPrincipalRolesExample

<!-- UsageSnippet language="python" operationID="getPrincipalRoles" method="get" path="/v2/accounts/{account_id}/permissions/principal_roles" example="GetPrincipalRolesExample" -->
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

    res = cld_provisioning.principals.list_roles(request={
        "principal_type": cloudinary_account_provisioning.PrincipalTypeEnum.USER,
        "principal_id": "<id>",
        "permission_type": cloudinary_account_provisioning.PermissionTypeEnum.GLOBAL,
        "management_type": cloudinary_account_provisioning.ManagementTypeEnum.SYSTEM,
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "param_key": [
            "folder_id",
        ],
        "param_value": [
            "asdfjkl12347890",
        ],
    })

    # Handle response
    print(res)

```
### Example Usage: GetPrincipalRolesWithParamKeyValueExample

<!-- UsageSnippet language="python" operationID="getPrincipalRoles" method="get" path="/v2/accounts/{account_id}/permissions/principal_roles" example="GetPrincipalRolesWithParamKeyValueExample" -->
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

    res = cld_provisioning.principals.list_roles(request={
        "principal_type": cloudinary_account_provisioning.PrincipalTypeEnum.USER,
        "principal_id": "<id>",
        "permission_type": cloudinary_account_provisioning.PermissionTypeEnum.GLOBAL,
        "management_type": cloudinary_account_provisioning.ManagementTypeEnum.SYSTEM,
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "param_key": [
            "folder_id",
        ],
        "param_value": [
            "asdfjkl12347890",
        ],
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                   | Type                                                                        | Required                                                                    | Description                                                                 |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `request`                                                                   | [models.GetPrincipalRolesRequest](../../models/getprincipalrolesrequest.md) | :heavy_check_mark:                                                          | The request object to use for the request.                                  |
| `retries`                                                                   | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)            | :heavy_minus_sign:                                                          | Configuration to override the default retry behavior of the client.         |

### Response

**[models.PrincipalRolesResponse](../../models/principalrolesresponse.md)**

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| models.PermissionsErrorResponse | 400, 401, 404                   | application/json                |
| models.PermissionsErrorResponse | 500                             | application/json                |
| models.APIError                 | 4XX, 5XX                        | \*/\*                           |

## update_roles

Add or remove roles associated with a principal.

### Example Usage: InvalidOperationFieldErrorExample

<!-- UsageSnippet language="python" operationID="updatePrincipalRoles" method="put" path="/v2/accounts/{account_id}/permissions/principal_roles" example="InvalidOperationFieldErrorExample" -->
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

    cld_provisioning.principals.update_roles(request={
        "operation": cloudinary_account_provisioning.OperationEnum.ADD,
        "principal": {
            "type": cloudinary_account_provisioning.PrincipalTypeEnum.USER,
            "id": "1234abc",
        },
        "roles": [
            {
                "id": "marketing_content_contributor_1357fhe",
                "scope_id": "975l29lz02jt0836fhwi",
                "policy_parameters": {},
            },
        ],
    })

    # Use the SDK ...

```
### Example Usage: missingPrincipalFieldsErrorExample

<!-- UsageSnippet language="python" operationID="updatePrincipalRoles" method="put" path="/v2/accounts/{account_id}/permissions/principal_roles" example="missingPrincipalFieldsErrorExample" -->
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

    cld_provisioning.principals.update_roles(request={
        "operation": cloudinary_account_provisioning.OperationEnum.ADD,
        "principal": {
            "type": cloudinary_account_provisioning.PrincipalTypeEnum.USER,
            "id": "1234abc",
        },
        "roles": [
            {
                "id": "marketing_content_contributor_1357fhe",
                "scope_id": "975l29lz02jt0836fhwi",
                "policy_parameters": {},
            },
        ],
    })

    # Use the SDK ...

```

### Parameters

| Parameter                                                                         | Type                                                                              | Required                                                                          | Description                                                                       |
| --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `request`                                                                         | [models.UpdatePrincipalRolesRequest](../../models/updateprincipalrolesrequest.md) | :heavy_check_mark:                                                                | The request object to use for the request.                                        |
| `retries`                                                                         | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                  | :heavy_minus_sign:                                                                | Configuration to override the default retry behavior of the client.               |

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| models.PermissionsErrorResponse | 400, 401, 403, 404              | application/json                |
| models.APIError                 | 4XX, 5XX                        | \*/\*                           |

## inspect

Retrieves principals and their assigned roles within a specified scope, based on query filters.

Use this endpoint to determine which users, groups, API keys, or account API keys have roles applied at:
* A specific `scope_type` ("account" or "prodenv")
* A specific `scope_id` (for product environments)
* Optional content filters (such as `folder_id`, `collection_id`, or `param_key` / `param_value`)
* Optional `principal_type` (and `principal_id`)

The response includes all principals that match the specified filters, along with the roles applied to them within that context.

This endpoint is useful when you want to:
* Audit who has access within a given scope
* Identify all principals assigned to roles for a specific folder, collection, asset, or product environment
* Retrieve role assignments dynamically based on filtering criteria


### Example Usage: InspectExampleAllFolders

<!-- UsageSnippet language="python" operationID="inspect" method="get" path="/v2/accounts/{account_id}/permissions/principal_roles/inspect" example="InspectExampleAllFolders" -->
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

    res = cld_provisioning.principals.inspect(request={
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "principal_type": cloudinary_account_provisioning.PrincipalTypeEnum.USER,
        "param_key": [
            "folder_id",
        ],
        "param_value": [
            "asdfjkl12347890",
        ],
    })

    # Handle response
    print(res)

```
### Example Usage: InspectExampleFolder

<!-- UsageSnippet language="python" operationID="inspect" method="get" path="/v2/accounts/{account_id}/permissions/principal_roles/inspect" example="InspectExampleFolder" -->
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

    res = cld_provisioning.principals.inspect(request={
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "principal_type": cloudinary_account_provisioning.PrincipalTypeEnum.USER,
        "param_key": [
            "folder_id",
        ],
        "param_value": [
            "asdfjkl12347890",
        ],
    })

    # Handle response
    print(res)

```
### Example Usage: InspectExampleProdEnv

<!-- UsageSnippet language="python" operationID="inspect" method="get" path="/v2/accounts/{account_id}/permissions/principal_roles/inspect" example="InspectExampleProdEnv" -->
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

    res = cld_provisioning.principals.inspect(request={
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "principal_type": cloudinary_account_provisioning.PrincipalTypeEnum.USER,
        "param_key": [
            "folder_id",
        ],
        "param_value": [
            "asdfjkl12347890",
        ],
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `request`                                                           | [models.InspectRequest1](../../models/inspectrequest1.md)           | :heavy_check_mark:                                                  | The request object to use for the request.                          |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.PrincipalRolesInspectResponse](../../models/principalrolesinspectresponse.md)**

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| models.PermissionsErrorResponse | 400, 401, 404                   | application/json                |
| models.PermissionsErrorResponse | 500                             | application/json                |
| models.APIError                 | 4XX, 5XX                        | \*/\*                           |

## inspect_multiple

Retrieves role assignments for a specified list of principals within a shared scope and optional policy parameters.

Use this endpoint when you already know which principals you want to evaluate and want to check their role assignments in a single request.

In this request:
* You explicitly provide the `principals` array in the request body.
* All principals are evaluated against the same `scope_type`, optional `scope_id`, and optional `policy_parameters`.
* Unlike `Inspect`, this endpoint doesn't search for matching principals. It evaluates only the principals you provide.

This endpoint is useful for:
* Verify role assignments for multiple specified principals at once
* Comparing role assignments across specific users, groups, or keys
* Reducing multiple per-principal `Inspect` calls into a single request


### Example Usage: InspectMultipleRequestExample

<!-- UsageSnippet language="python" operationID="inspectMultiple" method="post" path="/v2/accounts/{account_id}/permissions/principal_roles/inspect" example="InspectMultipleRequestExample" -->
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

    res = cld_provisioning.principals.inspect_multiple(request={
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "scope_id": "975l29lz02jt0836fhwi",
        "principals": [
            {
                "type": cloudinary_account_provisioning.PrincipalTypeEnum.USER,
                "id": "1234abc",
            },
            {
                "type": cloudinary_account_provisioning.PrincipalTypeEnum.USER,
                "id": "4567xyz",
            },
            {
                "type": cloudinary_account_provisioning.PrincipalTypeEnum.API_KEY,
                "id": "a382ltieo893jhioqpg8urp",
            },
        ],
        "policy_parameters": {},
    })

    # Handle response
    print(res)

```
### Example Usage: InspectMultipleResponseExample

<!-- UsageSnippet language="python" operationID="inspectMultiple" method="post" path="/v2/accounts/{account_id}/permissions/principal_roles/inspect" example="InspectMultipleResponseExample" -->
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

    res = cld_provisioning.principals.inspect_multiple(request={
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "principals": [
            {
                "type": cloudinary_account_provisioning.PrincipalTypeEnum.USER,
                "id": "1234abc",
            },
        ],
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `request`                                                           | [models.InspectRequest](../../models/inspectrequest.md)             | :heavy_check_mark:                                                  | The request object to use for the request.                          |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.PrincipalRolesInspectResponse](../../models/principalrolesinspectresponse.md)**

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| models.PermissionsErrorResponse | 400, 401, 404                   | application/json                |
| models.PermissionsErrorResponse | 500                             | application/json                |
| models.APIError                 | 4XX, 5XX                        | \*/\*                           |
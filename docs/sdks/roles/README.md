# Roles

## Overview

All roles include one or more predefined **system policies**, and can be applied to principals to enforce these policies.

You can **manage custom roles**, where you select the system policies.

You can **view system roles**, which contain a fixed set of system policies and are provided by Cloudinary.


### Available Operations

* [list](#list) - Get roles
* [create](#create) - Create custom role
* [get](#get) - Get role
* [update](#update) - Update custom role
* [delete](#delete) - Delete custom role
* [list_principals](#list_principals) - Get a role's principals
* [update_principals](#update_principals) - Assign principals to a role

## list

Retrieve all system and custom roles of a specific `permission_type` (global or content-specific). Optionally filter by `scope_type`, `management_type`, and `policy_parameters`.


### Example Usage

<!-- UsageSnippet language="python" operationID="getRoles" method="get" path="/v2/accounts/{account_id}/permissions/roles" example="GetRolesExample" -->
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

    res = cld_provisioning.roles.list(permission_type=cloudinary_account_provisioning.PermissionTypeEnum.GLOBAL, scope_type=cloudinary_account_provisioning.ScopeTypeEnum.PRODENV, management_type=cloudinary_account_provisioning.ManagementTypeEnum.SYSTEM)

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                                                                                                                                                                              | Type                                                                                                                                                                                                                                                                                                                                   | Required                                                                                                                                                                                                                                                                                                                               | Description                                                                                                                                                                                                                                                                                                                            | Example                                                                                                                                                                                                                                                                                                                                |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `permission_type`                                                                                                                                                                                                                                                                                                                      | [models.PermissionTypeEnum](../../models/permissiontypeenum.md)                                                                                                                                                                                                                                                                        | :heavy_check_mark:                                                                                                                                                                                                                                                                                                                     | Specifies whether to retrieve roles whose permissions apply globally across all contexts within the scope (i.e., security settings for the account, or all folders in a product environment), or specifically to designated content instances (i.e., folder with external ID "fg3841spr").                                             | global                                                                                                                                                                                                                                                                                                                                 |
| `scope_type`                                                                                                                                                                                                                                                                                                                           | [Optional[models.ScopeTypeEnum]](../../models/scopetypeenum.md)                                                                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                     | Specifies the level for retrieving policies or roles, either at the account level or within product environments.                                                                                                                                                                                                                      | prodenv                                                                                                                                                                                                                                                                                                                                |
| `management_type`                                                                                                                                                                                                                                                                                                                      | [Optional[models.ManagementTypeEnum]](../../models/managementtypeenum.md)                                                                                                                                                                                                                                                              | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                     | Specifies whether the role's policies are managed by Cloudinary (`system`) or by the user (`custom`).                                                                                                                                                                                                                                  | system                                                                                                                                                                                                                                                                                                                                 |
| `policy_parameters`                                                                                                                                                                                                                                                                                                                    | List[*str*]                                                                                                                                                                                                                                                                                                                            | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                     | For roles with `permission_type` set to `content`, this defines the type of content the role's policies apply to:<br/>- The content type can be: `folder_id` or `collection_id`.<br/>- When assigning the role, provide the instance, e.g. `{"folder_id":"asdfjkl12347890"}`. This specification is passed to the `policy_statement` (Cedar).<br/> |                                                                                                                                                                                                                                                                                                                                        |
| `retries`                                                                                                                                                                                                                                                                                                                              | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                                                                                                                                       | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                     | Configuration to override the default retry behavior of the client.                                                                                                                                                                                                                                                                    |                                                                                                                                                                                                                                                                                                                                        |

### Response

**[models.RolesResponse](../../models/rolesresponse.md)**

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| models.PermissionsErrorResponse | 401, 403                        | application/json                |
| models.PermissionsErrorResponse | 500                             | application/json                |
| models.APIError                 | 4XX, 5XX                        | \*/\*                           |

## create

Create a new custom role.

### Example Usage: createAcctRoleExample

<!-- UsageSnippet language="python" operationID="createRole" method="post" path="/v2/accounts/{account_id}/permissions/roles" example="createAcctRoleExample" -->
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

    res = cld_provisioning.roles.create(request={
        "id": "sensitive_account_details_manager_88825hl",
        "permission_type": "global",
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.ACCOUNT,
        "name": "Sensitive account details manager",
        "description": "Responsible for managing users and account security.",
        "system_policy_ids": [
            "cld::global::users_and_groups::manage",
            "cld::policy::global::account_security::manage",
        ],
    })

    # Handle response
    print(res)

```
### Example Usage: createAcctRoleResponseExample

<!-- UsageSnippet language="python" operationID="createRole" method="post" path="/v2/accounts/{account_id}/permissions/roles" example="createAcctRoleResponseExample" -->
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

    res = cld_provisioning.roles.create(request={
        "id": "upload_manager_12334565",
        "permission_type": "global",
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "name": "Upload manager",
        "description": "Responsible for managing upload presets and uploading new assets.",
        "system_policy_ids": [
            "cld::policy::global::upload_presets::manage",
            "cld::policy::global::folder_and_asset_management::create_asset",
        ],
    })

    # Handle response
    print(res)

```
### Example Usage: createContentRoleExample

<!-- UsageSnippet language="python" operationID="createRole" method="post" path="/v2/accounts/{account_id}/permissions/roles" example="createContentRoleExample" -->
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

    res = cld_provisioning.roles.create(request={
        "id": "marketing_content_contributor_1357fhe",
        "permission_type": "content",
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "name": "Marketing content contributor",
        "description": "View all assets in selected folders and contribute to those folders, without permission to download.",
        "system_policy_ids": [
            "cld::policy::content::folder::view_download",
            "cld::policy::content::folder::add_assets",
        ],
    })

    # Handle response
    print(res)

```
### Example Usage: createContentRoleResponseExample

<!-- UsageSnippet language="python" operationID="createRole" method="post" path="/v2/accounts/{account_id}/permissions/roles" example="createContentRoleResponseExample" -->
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

    res = cld_provisioning.roles.create(request={
        "id": "upload_manager_12334565",
        "permission_type": "global",
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "name": "Upload manager",
        "description": "Responsible for managing upload presets and uploading new assets.",
        "system_policy_ids": [
            "cld::policy::global::upload_presets::manage",
            "cld::policy::global::folder_and_asset_management::create_asset",
        ],
    })

    # Handle response
    print(res)

```
### Example Usage: createGlobalRoleExample

<!-- UsageSnippet language="python" operationID="createRole" method="post" path="/v2/accounts/{account_id}/permissions/roles" example="createGlobalRoleExample" -->
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

    res = cld_provisioning.roles.create(request={
        "id": "upload_manager_12334565",
        "permission_type": "global",
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "name": "Upload manager",
        "description": "Responsible for managing uploads and uploading new assets.",
        "system_policy_ids": [
            "cld::policy::global::upload_presets::manage",
            "cld::policy::global::folder_and_asset_management::create_asset",
        ],
    })

    # Handle response
    print(res)

```
### Example Usage: createGlobalRoleResponseExample

<!-- UsageSnippet language="python" operationID="createRole" method="post" path="/v2/accounts/{account_id}/permissions/roles" example="createGlobalRoleResponseExample" -->
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

    res = cld_provisioning.roles.create(request={
        "id": "upload_manager_12334565",
        "permission_type": "global",
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "name": "Upload manager",
        "description": "Responsible for managing upload presets and uploading new assets.",
        "system_policy_ids": [
            "cld::policy::global::upload_presets::manage",
            "cld::policy::global::folder_and_asset_management::create_asset",
        ],
    })

    # Handle response
    print(res)

```
### Example Usage: invalidFieldErrorExample

<!-- UsageSnippet language="python" operationID="createRole" method="post" path="/v2/accounts/{account_id}/permissions/roles" example="invalidFieldErrorExample" -->
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

    res = cld_provisioning.roles.create(request={
        "id": "upload_manager_12334565",
        "permission_type": "global",
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "name": "Upload manager",
        "description": "Responsible for managing upload presets and uploading new assets.",
        "system_policy_ids": [
            "cld::policy::global::upload_presets::manage",
            "cld::policy::global::folder_and_asset_management::create_asset",
        ],
    })

    # Handle response
    print(res)

```
### Example Usage: missingFieldsErrorExample

<!-- UsageSnippet language="python" operationID="createRole" method="post" path="/v2/accounts/{account_id}/permissions/roles" example="missingFieldsErrorExample" -->
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

    res = cld_provisioning.roles.create(request={
        "id": "upload_manager_12334565",
        "permission_type": "global",
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "name": "Upload manager",
        "description": "Responsible for managing upload presets and uploading new assets.",
        "system_policy_ids": [
            "cld::policy::global::upload_presets::manage",
            "cld::policy::global::folder_and_asset_management::create_asset",
        ],
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `request`                                                           | [models.CreateRole](../../models/createrole.md)                     | :heavy_check_mark:                                                  | The request object to use for the request.                          |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.RoleResponse](../../models/roleresponse.md)**

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| models.PermissionsErrorResponse | 400, 401, 403, 409              | application/json                |
| models.PermissionsErrorResponse | 500                             | application/json                |
| models.APIError                 | 4XX, 5XX                        | \*/\*                           |

## get

Get a specific system or custom role.

### Example Usage

<!-- UsageSnippet language="python" operationID="getRole" method="get" path="/v2/accounts/{account_id}/permissions/roles/{role_id}" example="GetRoleExample" -->
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

    res = cld_provisioning.roles.get(request={
        "role_id": "<id>",
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
| `request`                                                           | [models.GetRoleRequest](../../models/getrolerequest.md)             | :heavy_check_mark:                                                  | The request object to use for the request.                          |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.RoleResponse](../../models/roleresponse.md)**

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| models.PermissionsErrorResponse | 401, 403, 404                   | application/json                |
| models.APIError                 | 4XX, 5XX                        | \*/\*                           |

## update

Update a specific custom role by providing all relevant details, including those you want to keep as-is.

*Note:* Updating a role with a name that already exists will trigger a 409 error.


### Example Usage: invalidPolicyIDFieldErrorExample

<!-- UsageSnippet language="python" operationID="updateRole" method="put" path="/v2/accounts/{account_id}/permissions/roles/{role_id}" example="invalidPolicyIDFieldErrorExample" -->
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

    res = cld_provisioning.roles.update(role_id="<id>", role={
        "name": "Upload manager",
        "description": "Responsible for managing upload presets and uploading new assets.",
        "system_policy_ids": [
            "cld::policy::global::upload_presets::manage",
            "cld::policy::global::folder_and_asset_management::create_asset",
        ],
    })

    # Handle response
    print(res)

```
### Example Usage: missingFieldsErrorExample

<!-- UsageSnippet language="python" operationID="updateRole" method="put" path="/v2/accounts/{account_id}/permissions/roles/{role_id}" example="missingFieldsErrorExample" -->
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

    res = cld_provisioning.roles.update(role_id="<id>", role={
        "name": "Upload manager",
        "description": "Responsible for managing upload presets and uploading new assets.",
        "system_policy_ids": [
            "cld::policy::global::upload_presets::manage",
            "cld::policy::global::folder_and_asset_management::create_asset",
        ],
    })

    # Handle response
    print(res)

```
### Example Usage: updatePolicyResponse

<!-- UsageSnippet language="python" operationID="updateRole" method="put" path="/v2/accounts/{account_id}/permissions/roles/{role_id}" example="updatePolicyResponse" -->
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

    res = cld_provisioning.roles.update(role_id="<id>", role={
        "name": "Upload manager",
        "description": "Responsible for managing upload presets and uploading new assets.",
        "system_policy_ids": [
            "cld::policy::global::upload_presets::manage",
            "cld::policy::global::folder_and_asset_management::create_asset",
        ],
    })

    # Handle response
    print(res)

```
### Example Usage: updateRoleExample

<!-- UsageSnippet language="python" operationID="updateRole" method="put" path="/v2/accounts/{account_id}/permissions/roles/{role_id}" example="updateRoleExample" -->
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

    res = cld_provisioning.roles.update(role_id="<id>", role={
        "name": "Upload manager",
        "description": "Responsible for managing uploads and uploading new assets.",
        "system_policy_ids": [
            "cld::policy::global::upload_presets::manage",
            "cld::policy::global::folder_and_asset_management::create_asset",
        ],
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `role_id`                                                           | *str*                                                               | :heavy_check_mark:                                                  | A unique identifier for the role.                                   |
| `role`                                                              | [models.Role](../../models/role.md)                                 | :heavy_check_mark:                                                  | Role details                                                        |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.RoleResponse](../../models/roleresponse.md)**

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| models.PermissionsErrorResponse | 400, 401, 403, 404, 409         | application/json                |
| models.PermissionsErrorResponse | 500                             | application/json                |
| models.APIError                 | 4XX, 5XX                        | \*/\*                           |

## delete

Delete a specific custom role.

### Example Usage

<!-- UsageSnippet language="python" operationID="deleteRole" method="delete" path="/v2/accounts/{account_id}/permissions/roles/{role_id}" -->
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

    cld_provisioning.roles.delete(role_id="<id>")

    # Use the SDK ...

```

### Parameters

| Parameter                                                                                                                                                                                                                                                                                               | Type                                                                                                                                                                                                                                                                                                    | Required                                                                                                                                                                                                                                                                                                | Description                                                                                                                                                                                                                                                                                             |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `role_id`                                                                                                                                                                                                                                                                                               | *str*                                                                                                                                                                                                                                                                                                   | :heavy_check_mark:                                                                                                                                                                                                                                                                                      | A unique identifier for the role.                                                                                                                                                                                                                                                                       |
| `force`                                                                                                                                                                                                                                                                                                 | *Optional[bool]*                                                                                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                                                                                      | Determines whether the role should be deleted when it has associated principals.<br/>- `true`: Deletes the role even if it has associated principals.<br/>- `false` (default): Prevents deletion if the role has associated principals. You must manually unassociate the principals before deleting the role.<br/> |
| `retries`                                                                                                                                                                                                                                                                                               | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                                                                                      | Configuration to override the default retry behavior of the client.                                                                                                                                                                                                                                     |

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| models.PermissionsErrorResponse | 401, 403, 404                   | application/json                |
| models.APIError                 | 4XX, 5XX                        | \*/\*                           |

## list_principals

Retrieve all principals associated with a specific role.

### Example Usage: GetRolePrincipalsExample

<!-- UsageSnippet language="python" operationID="getRolePrincipals" method="get" path="/v2/accounts/{account_id}/permissions/roles/{role_id}/principals" example="GetRolePrincipalsExample" -->
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

    res = cld_provisioning.roles.list_principals(request={
        "role_id": "<id>",
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
### Example Usage: GetRolePrincipalsWithParamKeyValueExample

<!-- UsageSnippet language="python" operationID="getRolePrincipals" method="get" path="/v2/accounts/{account_id}/permissions/roles/{role_id}/principals" example="GetRolePrincipalsWithParamKeyValueExample" -->
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

    res = cld_provisioning.roles.list_principals(request={
        "role_id": "<id>",
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
| `request`                                                                   | [models.GetRolePrincipalsRequest](../../models/getroleprincipalsrequest.md) | :heavy_check_mark:                                                          | The request object to use for the request.                                  |
| `retries`                                                                   | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)            | :heavy_minus_sign:                                                          | Configuration to override the default retry behavior of the client.         |

### Response

**[models.PrincipalsResponse](../../models/principalsresponse.md)**

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| models.PermissionsErrorResponse | 401, 403, 404                   | application/json                |
| models.APIError                 | 4XX, 5XX                        | \*/\*                           |

## update_principals

Add or remove principals associated with a role.

### Example Usage: invalidOperationFieldErrorExample

<!-- UsageSnippet language="python" operationID="updateRolePrincipals" method="put" path="/v2/accounts/{account_id}/permissions/roles/{role_id}/principals" example="invalidOperationFieldErrorExample" -->
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

    cld_provisioning.roles.update_principals(role_id="<id>", update_role_principals_request={
        "operation": cloudinary_account_provisioning.OperationEnum.ADD,
        "principals": [
            {
                "principal_type": cloudinary_account_provisioning.PrincipalTypeEnum.USER,
                "principal_id": "1234abc",
                "scope_id": "975l29lz02jt0836fhwi",
                "policy_parameters": {},
            },
        ],
    })

    # Use the SDK ...

```
### Example Usage: missingFieldsErrorExample

<!-- UsageSnippet language="python" operationID="updateRolePrincipals" method="put" path="/v2/accounts/{account_id}/permissions/roles/{role_id}/principals" example="missingFieldsErrorExample" -->
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

    cld_provisioning.roles.update_principals(role_id="<id>", update_role_principals_request={
        "operation": cloudinary_account_provisioning.OperationEnum.ADD,
        "principals": [
            {
                "principal_type": cloudinary_account_provisioning.PrincipalTypeEnum.USER,
                "principal_id": "1234abc",
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
| `role_id`                                                                         | *str*                                                                             | :heavy_check_mark:                                                                | A unique identifier for the role.                                                 |
| `update_role_principals_request`                                                  | [models.UpdateRolePrincipalsRequest](../../models/updateroleprincipalsrequest.md) | :heavy_check_mark:                                                                | Principals details.                                                               |
| `retries`                                                                         | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                  | :heavy_minus_sign:                                                                | Configuration to override the default retry behavior of the client.               |

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| models.PermissionsErrorResponse | 400, 401, 403, 404              | application/json                |
| models.APIError                 | 4XX, 5XX                        | \*/\*                           |
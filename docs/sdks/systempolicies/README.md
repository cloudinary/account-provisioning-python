# SystemPolicies

## Overview

### Available Operations

* [list](#list) - Get system policies

## list

Retrieve all system-defined permission policies. Optionally filter the results by `scope_type` (account or product environment) and/or `permission_type` (global or content-specific).

**Note:** If `scope_type` isn't specified as `prodenv`, the account-level policies will be returned.


### Example Usage

<!-- UsageSnippet language="python" operationID="getSystemPolicies" method="get" path="/v2/accounts/{account_id}/permissions/policies/system" example="SystemPoliciesExample" -->
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

    res = cld_provisioning.system_policies.list(permission_type=cloudinary_account_provisioning.PermissionTypeEnum.GLOBAL, scope_type=cloudinary_account_provisioning.ScopeTypeEnum.PRODENV)

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                                                                                                                                  | Type                                                                                                                                                                                                                                                                                       | Required                                                                                                                                                                                                                                                                                   | Description                                                                                                                                                                                                                                                                                | Example                                                                                                                                                                                                                                                                                    |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `permission_type`                                                                                                                                                                                                                                                                          | [Optional[models.PermissionTypeEnum]](../../models/permissiontypeenum.md)                                                                                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                                                                                                         | Specifies whether to retrieve roles whose permissions apply globally across all contexts within the scope (i.e., security settings for the account, or all folders in a product environment), or specifically to designated content instances (i.e., folder with external ID "fg3841spr"). | global                                                                                                                                                                                                                                                                                     |
| `scope_type`                                                                                                                                                                                                                                                                               | [Optional[models.ScopeTypeEnum]](../../models/scopetypeenum.md)                                                                                                                                                                                                                            | :heavy_minus_sign:                                                                                                                                                                                                                                                                         | Specifies the level for retrieving policies or roles, either at the account level or within product environments.                                                                                                                                                                          | prodenv                                                                                                                                                                                                                                                                                    |
| `retries`                                                                                                                                                                                                                                                                                  | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                                                                                           | :heavy_minus_sign:                                                                                                                                                                                                                                                                         | Configuration to override the default retry behavior of the client.                                                                                                                                                                                                                        |                                                                                                                                                                                                                                                                                            |

### Response

**[models.SystemPoliciesResponse](../../models/systempoliciesresponse.md)**

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| models.PermissionsErrorResponse | 401, 403                        | application/json                |
| models.PermissionsErrorResponse | 500                             | application/json                |
| models.APIError                 | 4XX, 5XX                        | \*/\*                           |
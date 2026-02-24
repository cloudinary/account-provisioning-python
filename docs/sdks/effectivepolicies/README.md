# EffectivePolicies

## Overview

### Available Operations

* [list](#list) - Get effective policies

## list

Retrieve all roles (along with their system permission policies) associated with principals, and all custom permission policies directly added to principals, all within a specified scope.

Optionally specify a principal to only include roles and policies associated with that principal.


### Example Usage

<!-- UsageSnippet language="python" operationID="getEffectivePolicies" method="get" path="/v2/accounts/{account_id}/permissions/policies/effective" example="EffectivePoliciesExample" -->
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

    res = cld_provisioning.effective_policies.list(scope_type=cloudinary_account_provisioning.ScopeTypeEnum.PRODENV, principal_type=cloudinary_account_provisioning.PrincipalTypeEnum.USER)

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                                                                                          | Type                                                                                                                                                                                                                                               | Required                                                                                                                                                                                                                                           | Description                                                                                                                                                                                                                                        | Example                                                                                                                                                                                                                                            |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `scope_type`                                                                                                                                                                                                                                       | [Optional[models.ScopeTypeEnum]](../../models/scopetypeenum.md)                                                                                                                                                                                    | :heavy_minus_sign:                                                                                                                                                                                                                                 | Specifies the level for retrieving policies or roles, either at the account level or within product environments.                                                                                                                                  | prodenv                                                                                                                                                                                                                                            |
| `scope_id`                                                                                                                                                                                                                                         | *Optional[str]*                                                                                                                                                                                                                                    | :heavy_minus_sign:                                                                                                                                                                                                                                 | The ID of a specific product environment where the policy is applied. This parameter is only relevant if `scope_type` is "prodenv".<br/>- <product_environment_id><br/>                                                                            |                                                                                                                                                                                                                                                    |
| `principal_type`                                                                                                                                                                                                                                   | [Optional[models.PrincipalTypeEnum]](../../models/principaltypeenum.md)                                                                                                                                                                            | :heavy_minus_sign:                                                                                                                                                                                                                                 | The type of principal you want to retrieve roles or permission policies for.                                                                                                                                                                       | user                                                                                                                                                                                                                                               |
| `principal_id`                                                                                                                                                                                                                                     | *Optional[str]*                                                                                                                                                                                                                                    | :heavy_minus_sign:                                                                                                                                                                                                                                 | The unique identifier of the principal you want to retrieve roles or permission policies for.<br/><br/>**Notes:**<br/><br/>* This parameter is mandatory if `principal_type` is provided.<br/>* Ensure the specified ID belongs to a principle of the specified type.<br/> |                                                                                                                                                                                                                                                    |
| `retries`                                                                                                                                                                                                                                          | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                                                                                 | Configuration to override the default retry behavior of the client.                                                                                                                                                                                |                                                                                                                                                                                                                                                    |

### Response

**[models.EffectivePoliciesResponse](../../models/effectivepoliciesresponse.md)**

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| models.PermissionsErrorResponse | 400, 401, 403, 404              | application/json                |
| models.PermissionsErrorResponse | 500                             | application/json                |
| models.APIError                 | 4XX, 5XX                        | \*/\*                           |
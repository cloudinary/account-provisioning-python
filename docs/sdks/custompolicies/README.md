# CustomPolicies

## Overview

### Available Operations

* [list](#list) - Get custom policies
* [create](#create) - Create custom policy
* [get](#get) - Get custom policy
* [update](#update) - Update custom policy
* [delete](#delete) - Delete custom policy

## list

Retrieve all custom permission policies defined for a specific scope. The scope can be at the account level or within a specific product environment.

**Notes:**
  * If `scope_type` isn't specified as `prodenv`, the account-level policies will be returned.

  * If `scope_type` is specified as `prodenv`, `scope_id` is required.


### Example Usage

<!-- UsageSnippet language="python" operationID="getCustomPolicies" method="get" path="/v2/accounts/{account_id}/permissions/policies/custom" example="CustomPoliciesExample" -->
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

    res = cld_provisioning.custom_policies.list(scope_type=cloudinary_account_provisioning.ScopeTypeEnum.PRODENV)

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                       | Type                                                                                                                                                            | Required                                                                                                                                                        | Description                                                                                                                                                     | Example                                                                                                                                                         |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `scope_type`                                                                                                                                                    | [Optional[models.ScopeTypeEnum]](../../models/scopetypeenum.md)                                                                                                 | :heavy_minus_sign:                                                                                                                                              | Specifies the level for retrieving policies or roles, either at the account level or within product environments.                                               | prodenv                                                                                                                                                         |
| `scope_id`                                                                                                                                                      | *Optional[str]*                                                                                                                                                 | :heavy_minus_sign:                                                                                                                                              | The ID of a specific product environment where the policy is applied. This parameter is only relevant if `scope_type` is "prodenv".<br/>- <product_environment_id><br/> |                                                                                                                                                                 |
| `enabled`                                                                                                                                                       | *OptionalNullable[bool]*                                                                                                                                        | :heavy_minus_sign:                                                                                                                                              | Filter policies by enabled status (true/false).                                                                                                                 |                                                                                                                                                                 |
| `cursor`                                                                                                                                                        | *Optional[str]*                                                                                                                                                 | :heavy_minus_sign:                                                                                                                                              | A pagination cursor for fetching subsequent results.                                                                                                            |                                                                                                                                                                 |
| `retries`                                                                                                                                                       | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                | :heavy_minus_sign:                                                                                                                                              | Configuration to override the default retry behavior of the client.                                                                                             |                                                                                                                                                                 |

### Response

**[models.CustomPoliciesResponse](../../models/custompoliciesresponse.md)**

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| models.PermissionsErrorResponse | 401, 403                        | application/json                |
| models.PermissionsErrorResponse | 500                             | application/json                |
| models.APIError                 | 4XX, 5XX                        | \*/\*                           |

## create

Create a new custom policy with a statement defined in Cedar. This policy specifies permissions for a principal, allowing a specific action on a designated resource, within a particular scope.

Learn more about creating a new custom policy
<https://cloudinary.com/documentation/permissions_api_guide#create_a_policy_statement>

### Example Usage: cedarErrorExample

<!-- UsageSnippet language="python" operationID="createCustomPolicy" method="post" path="/v2/accounts/{account_id}/permissions/policies/custom" example="cedarErrorExample" -->
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

    res = cld_provisioning.custom_policies.create(request={
        "policy_statement": "permit(principal == Cloudinary::APIKey::\\\"1234\\\",action==Cloudinary::Action::\\\"read\\\",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains(\\\"asdfjkl12347890\\\")} ;\n",
        "description": "Permit read access to the Clothing folder with external ID asdfjkl12347890.",
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "scope_id": "975l29lz02jt0836fhwi",
        "name": "Read access to Clothing folder",
    })

    # Handle response
    print(res)

```
### Example Usage: createCustomPolicyExample

<!-- UsageSnippet language="python" operationID="createCustomPolicy" method="post" path="/v2/accounts/{account_id}/permissions/policies/custom" example="createCustomPolicyExample" -->
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

    res = cld_provisioning.custom_policies.create(request={
        "policy_statement": "permit(principal == Cloudinary::APIKey::\"1234\",action==Cloudinary::Action::\"read\",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains(\"asdfjkl12347890\")} ;",
        "description": "Permit read access to the Clothing folder with external ID asdfjkl12347890.",
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "scope_id": "975l29lz02jt0836fhwi",
        "name": "Read access to Clothing folder",
    })

    # Handle response
    print(res)

```
### Example Usage: createPolicyResponse

<!-- UsageSnippet language="python" operationID="createCustomPolicy" method="post" path="/v2/accounts/{account_id}/permissions/policies/custom" example="createPolicyResponse" -->
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

    res = cld_provisioning.custom_policies.create(request={
        "policy_statement": "permit(principal == Cloudinary::APIKey::\\\"1234\\\",action==Cloudinary::Action::\\\"read\\\",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains(\\\"asdfjkl12347890\\\")} ;\n",
        "description": "Permit read access to the Clothing folder with external ID asdfjkl12347890.",
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "scope_id": "975l29lz02jt0836fhwi",
        "name": "Read access to Clothing folder",
    })

    # Handle response
    print(res)

```
### Example Usage: invalidFieldErrorExample

<!-- UsageSnippet language="python" operationID="createCustomPolicy" method="post" path="/v2/accounts/{account_id}/permissions/policies/custom" example="invalidFieldErrorExample" -->
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

    res = cld_provisioning.custom_policies.create(request={
        "policy_statement": "permit(principal == Cloudinary::APIKey::\\\"1234\\\",action==Cloudinary::Action::\\\"read\\\",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains(\\\"asdfjkl12347890\\\")} ;\n",
        "description": "Permit read access to the Clothing folder with external ID asdfjkl12347890.",
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "scope_id": "975l29lz02jt0836fhwi",
        "name": "Read access to Clothing folder",
    })

    # Handle response
    print(res)

```
### Example Usage: missingFieldsErrorExample

<!-- UsageSnippet language="python" operationID="createCustomPolicy" method="post" path="/v2/accounts/{account_id}/permissions/policies/custom" example="missingFieldsErrorExample" -->
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

    res = cld_provisioning.custom_policies.create(request={
        "policy_statement": "permit(principal == Cloudinary::APIKey::\\\"1234\\\",action==Cloudinary::Action::\\\"read\\\",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains(\\\"asdfjkl12347890\\\")} ;\n",
        "description": "Permit read access to the Clothing folder with external ID asdfjkl12347890.",
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "scope_id": "975l29lz02jt0836fhwi",
        "name": "Read access to Clothing folder",
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `request`                                                           | [models.CustomPolicy](../../models/custompolicy.md)                 | :heavy_check_mark:                                                  | The request object to use for the request.                          |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.CustomPolicyResponse](../../models/custompolicyresponse.md)**

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| models.PermissionsErrorResponse | 400, 401, 403, 409              | application/json                |
| models.PermissionsErrorResponse | 500                             | application/json                |
| models.APIError                 | 4XX, 5XX                        | \*/\*                           |

## get

Get a specific custom policy.

### Example Usage

<!-- UsageSnippet language="python" operationID="getCustomPolicy" method="get" path="/v2/accounts/{account_id}/permissions/policies/custom/{policy_id}" example="CustomPolicyExample" -->
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

    res = cld_provisioning.custom_policies.get(policy_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `policy_id`                                                         | *str*                                                               | :heavy_check_mark:                                                  | A unique identifier for the custom permission policy.               |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.CustomPolicyResponse](../../models/custompolicyresponse.md)**

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| models.PermissionsErrorResponse | 401, 403, 404                   | application/json                |
| models.APIError                 | 4XX, 5XX                        | \*/\*                           |

## update

Update a specific custom policy by providing the entire policy entity in the request body. Ensure the new `policy_statement` includes modifications. Existing permissions will be replaced with the new data.

*Note:* Updating a policy with an identical `policy_statement` will trigger a 409 error.


### Example Usage: cedarErrorExample

<!-- UsageSnippet language="python" operationID="updateCustomPolicy" method="put" path="/v2/accounts/{account_id}/permissions/policies/custom/{policy_id}" example="cedarErrorExample" -->
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

    res = cld_provisioning.custom_policies.update(policy_id="<id>", update_custom_policy={
        "policy_statement": "permit(principal == Cloudinary::APIKey::\\\"1234\\\",action==Cloudinary::Action::\\\"read\\\",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains(\\\"asdfjkl12347890\\\")} ;\n",
        "description": "Permit read access to the Clothing folder with external ID asdfjkl12347890.",
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "scope_id": "975l29lz02jt0836fhwi",
        "name": "Read access to Clothing folder",
    })

    # Handle response
    print(res)

```
### Example Usage: invalidFieldErrorExample

<!-- UsageSnippet language="python" operationID="updateCustomPolicy" method="put" path="/v2/accounts/{account_id}/permissions/policies/custom/{policy_id}" example="invalidFieldErrorExample" -->
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

    res = cld_provisioning.custom_policies.update(policy_id="<id>", update_custom_policy={
        "policy_statement": "permit(principal == Cloudinary::APIKey::\\\"1234\\\",action==Cloudinary::Action::\\\"read\\\",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains(\\\"asdfjkl12347890\\\")} ;\n",
        "description": "Permit read access to the Clothing folder with external ID asdfjkl12347890.",
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "scope_id": "975l29lz02jt0836fhwi",
        "name": "Read access to Clothing folder",
    })

    # Handle response
    print(res)

```
### Example Usage: missingFieldsUpdateErrorExample

<!-- UsageSnippet language="python" operationID="updateCustomPolicy" method="put" path="/v2/accounts/{account_id}/permissions/policies/custom/{policy_id}" example="missingFieldsUpdateErrorExample" -->
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

    res = cld_provisioning.custom_policies.update(policy_id="<id>", update_custom_policy={
        "policy_statement": "permit(principal == Cloudinary::APIKey::\\\"1234\\\",action==Cloudinary::Action::\\\"read\\\",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains(\\\"asdfjkl12347890\\\")} ;\n",
        "description": "Permit read access to the Clothing folder with external ID asdfjkl12347890.",
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "scope_id": "975l29lz02jt0836fhwi",
        "name": "Read access to Clothing folder",
    })

    # Handle response
    print(res)

```
### Example Usage: updateCustomPolicyExample

<!-- UsageSnippet language="python" operationID="updateCustomPolicy" method="put" path="/v2/accounts/{account_id}/permissions/policies/custom/{policy_id}" example="updateCustomPolicyExample" -->
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

    res = cld_provisioning.custom_policies.update(policy_id="<id>", update_custom_policy={
        "policy_statement": "permit(principal == Cloudinary::APIKey::\"1234\",action==Cloudinary::Action::\"read\",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains(\"asdfjkl12347890\")} ;",
        "description": "Permit read access to the Accessories folder with external ID asdfjkl12347890.",
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "scope_id": "975l29lz02jt0836fhwi",
        "name": "Read access to Accessories folder",
    })

    # Handle response
    print(res)

```
### Example Usage: updatePolicyResponse

<!-- UsageSnippet language="python" operationID="updateCustomPolicy" method="put" path="/v2/accounts/{account_id}/permissions/policies/custom/{policy_id}" example="updatePolicyResponse" -->
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

    res = cld_provisioning.custom_policies.update(policy_id="<id>", update_custom_policy={
        "policy_statement": "permit(principal == Cloudinary::APIKey::\\\"1234\\\",action==Cloudinary::Action::\\\"read\\\",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains(\\\"asdfjkl12347890\\\")} ;\n",
        "description": "Permit read access to the Clothing folder with external ID asdfjkl12347890.",
        "scope_type": cloudinary_account_provisioning.ScopeTypeEnum.PRODENV,
        "scope_id": "975l29lz02jt0836fhwi",
        "name": "Read access to Clothing folder",
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `policy_id`                                                         | *str*                                                               | :heavy_check_mark:                                                  | A unique identifier for the custom permission policy.               |
| `update_custom_policy`                                              | [models.UpdateCustomPolicy](../../models/updatecustompolicy.md)     | :heavy_check_mark:                                                  | Policy details                                                      |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.CustomPolicyResponse](../../models/custompolicyresponse.md)**

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| models.PermissionsErrorResponse | 400, 401, 403, 404, 409         | application/json                |
| models.PermissionsErrorResponse | 500                             | application/json                |
| models.APIError                 | 4XX, 5XX                        | \*/\*                           |

## delete

Delete a specific custom policy.

### Example Usage

<!-- UsageSnippet language="python" operationID="deleteCustomPolicy" method="delete" path="/v2/accounts/{account_id}/permissions/policies/custom/{policy_id}" -->
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

    cld_provisioning.custom_policies.delete(policy_id="<id>")

    # Use the SDK ...

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `policy_id`                                                         | *str*                                                               | :heavy_check_mark:                                                  | A unique identifier for the custom permission policy.               |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| models.PermissionsErrorResponse | 401, 403, 404                   | application/json                |
| models.APIError                 | 4XX, 5XX                        | \*/\*                           |
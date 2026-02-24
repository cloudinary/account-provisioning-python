# UserGroups

## Overview

### Available Operations

* [list](#list) - Get User Groups
* [create](#create) - Create User Group
* [get](#get) - Get User Group
* [update](#update) - Update User Group
* [delete](#delete) - Delete User Group
* [list_users](#list_users) - Get Users in User Group
* [add_user](#add_user) - Add User to User Group
* [remove_user](#remove_user) - Remove User from User Group

## list

Retrieve an array of all user groups in the account.

Learn more about retrieving user groups.
<https://cloudinary.com/documentation/provisioning_api#get_user_groups>

### Example Usage: UserGroups

<!-- UsageSnippet language="python" operationID="getUserGroups" method="get" path="/v1_1/provisioning/accounts/{account_id}/user_groups" example="UserGroups" -->
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

    res = cld_provisioning.user_groups.list(extended_details=True)

    # Handle response
    print(res)

```
### Example Usage: UserGroupsExtendedDetails

<!-- UsageSnippet language="python" operationID="getUserGroups" method="get" path="/v1_1/provisioning/accounts/{account_id}/user_groups" example="UserGroupsExtendedDetails" -->
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

    res = cld_provisioning.user_groups.list(extended_details=True)

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                 | Type                                                                                                      | Required                                                                                                  | Description                                                                                               | Example                                                                                                   |
| --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `extended_details`                                                                                        | *Optional[bool]*                                                                                          | :heavy_minus_sign:                                                                                        | Whether to only return extended (true) or basic information about the group (false).<br/>**Default**: false.<br/> | true                                                                                                      |
| `retries`                                                                                                 | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                          | :heavy_minus_sign:                                                                                        | Configuration to override the default retry behavior of the client.                                       |                                                                                                           |

### Response

**[models.UserGroupsResponse](../../models/usergroupsresponse.md)**

### Errors

| Error Type           | Status Code          | Content Type         |
| -------------------- | -------------------- | -------------------- |
| models.ErrorResponse | 401, 404, 420, 429   | application/json     |
| models.APIError      | 4XX, 5XX             | \*/\*                |

## create

Create a new user group for the account.

Learn more about creating user groups.
<https://cloudinary.com/documentation/provisioning_api#create_user_group>

### Example Usage

<!-- UsageSnippet language="python" operationID="createUserGroup" method="post" path="/v1_1/provisioning/accounts/{account_id}/user_groups" example="UserGroupDesigners" -->
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

    res = cld_provisioning.user_groups.create(request={
        "name": "Designers",
        "extended_details": False,
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `request`                                                           | [models.UserGroupRequest](../../models/usergrouprequest.md)         | :heavy_check_mark:                                                  | The request object to use for the request.                          |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.UserGroup](../../models/usergroup.md)**

### Errors

| Error Type                        | Status Code                       | Content Type                      |
| --------------------------------- | --------------------------------- | --------------------------------- |
| models.ErrorResponse              | 400, 401, 403, 404, 409, 420, 429 | application/json                  |
| models.APIError                   | 4XX, 5XX                          | \*/\*                             |

## get

Retrieve a specific user group.

Learn more about retrieving a specific user group.
<https://cloudinary.com/documentation/provisioning_api#get_user_group>

### Example Usage: UserGroupDesigners

<!-- UsageSnippet language="python" operationID="getUserGroup" method="get" path="/v1_1/provisioning/accounts/{account_id}/user_groups/{group_id}" example="UserGroupDesigners" -->
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

    res = cld_provisioning.user_groups.get(group_id="7f08f1f1fc910bf1f25274aef11d27", extended_details=True)

    # Handle response
    print(res)

```
### Example Usage: UserGroupDesignersExtendedDetails

<!-- UsageSnippet language="python" operationID="getUserGroup" method="get" path="/v1_1/provisioning/accounts/{account_id}/user_groups/{group_id}" example="UserGroupDesignersExtendedDetails" -->
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

    res = cld_provisioning.user_groups.get(group_id="7f08f1f1fc910bf1f25274aef11d27", extended_details=True)

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                 | Type                                                                                                      | Required                                                                                                  | Description                                                                                               | Example                                                                                                   |
| --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `group_id`                                                                                                | *str*                                                                                                     | :heavy_check_mark:                                                                                        | The ID of the user group.                                                                                 | 7f08f1f1fc910bf1f25274aef11d27                                                                            |
| `extended_details`                                                                                        | *Optional[bool]*                                                                                          | :heavy_minus_sign:                                                                                        | Whether to only return extended (true) or basic information about the group (false).<br/>**Default**: false.<br/> | true                                                                                                      |
| `retries`                                                                                                 | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                          | :heavy_minus_sign:                                                                                        | Configuration to override the default retry behavior of the client.                                       |                                                                                                           |

### Response

**[models.UserGroup](../../models/usergroup.md)**

### Errors

| Error Type           | Status Code          | Content Type         |
| -------------------- | -------------------- | -------------------- |
| models.ErrorResponse | 401, 404, 420, 429   | application/json     |
| models.APIError      | 4XX, 5XX             | \*/\*                |

## update

Update the name of a specified user group.

Learn more about updating a specific user group.
<https://cloudinary.com/documentation/provisioning_api#update_user_group>

### Example Usage: UserGroupDesignersRequest

<!-- UsageSnippet language="python" operationID="updateUserGroup" method="put" path="/v1_1/provisioning/accounts/{account_id}/user_groups/{group_id}" example="UserGroupDesignersRequest" -->
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

    res = cld_provisioning.user_groups.update(group_id="7f08f1f1fc910bf1f25274aef11d27", user_group_request={
        "name": "Designers and Creatives",
    })

    # Handle response
    print(res)

```
### Example Usage: UserGroupUpdate

<!-- UsageSnippet language="python" operationID="updateUserGroup" method="put" path="/v1_1/provisioning/accounts/{account_id}/user_groups/{group_id}" example="UserGroupUpdate" -->
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

    res = cld_provisioning.user_groups.update(group_id="7f08f1f1fc910bf1f25274aef11d27", user_group_request={
        "name": "Designers",
        "extended_details": False,
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `group_id`                                                          | *str*                                                               | :heavy_check_mark:                                                  | The ID of the user group.                                           | 7f08f1f1fc910bf1f25274aef11d27                                      |
| `user_group_request`                                                | [models.UserGroupRequest](../../models/usergrouprequest.md)         | :heavy_check_mark:                                                  | User group details to update.                                       |                                                                     |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.UserGroup](../../models/usergroup.md)**

### Errors

| Error Type                        | Status Code                       | Content Type                      |
| --------------------------------- | --------------------------------- | --------------------------------- |
| models.ErrorResponse              | 400, 401, 403, 404, 409, 420, 429 | application/json                  |
| models.APIError                   | 4XX, 5XX                          | \*/\*                             |

## delete

Delete a user group with the specified ID.

Learn more about deleting a specific user group.
<https://cloudinary.com/documentation/provisioning_api#delete_user_group>

### Example Usage

<!-- UsageSnippet language="python" operationID="deleteUserGroup" method="delete" path="/v1_1/provisioning/accounts/{account_id}/user_groups/{group_id}" -->
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

    res = cld_provisioning.user_groups.delete(group_id="7f08f1f1fc910bf1f25274aef11d27")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `group_id`                                                          | *str*                                                               | :heavy_check_mark:                                                  | The ID of the user group.                                           | 7f08f1f1fc910bf1f25274aef11d27                                      |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.SuccessResponse](../../models/successresponse.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| models.ErrorResponse         | 400, 401, 403, 404, 420, 429 | application/json             |
| models.APIError              | 4XX, 5XX                     | \*/\*                        |

## list_users

Retrieve the users in the group with the specified ID.

Learn more about retrieving users in a specific user group.
<https://cloudinary.com/documentation/provisioning_api#get_user_group_users>

### Example Usage

<!-- UsageSnippet language="python" operationID="getUsersInUserGroup" method="get" path="/v1_1/provisioning/accounts/{account_id}/user_groups/{group_id}/users" example="UserGroupUsers" -->
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

    res = cld_provisioning.user_groups.list_users(group_id="7f08f1f1fc910bf1f25274aef11d27")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `group_id`                                                          | *str*                                                               | :heavy_check_mark:                                                  | The ID of the user group.                                           | 7f08f1f1fc910bf1f25274aef11d27                                      |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.UserGroupUsersResponse](../../models/usergroupusersresponse.md)**

### Errors

| Error Type           | Status Code          | Content Type         |
| -------------------- | -------------------- | -------------------- |
| models.ErrorResponse | 401, 404, 420, 429   | application/json     |
| models.APIError      | 4XX, 5XX             | \*/\*                |

## add_user

Add a user to a group with the specified ID.

Learn more about adding users to a specific user group.
<https://cloudinary.com/documentation/provisioning_api#add_user_to_group>

### Example Usage

<!-- UsageSnippet language="python" operationID="addUserToUserGroup" method="post" path="/v1_1/provisioning/accounts/{account_id}/user_groups/{group_id}/users/{user_id}" example="UserGroupUserJohn" -->
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

    res = cld_provisioning.user_groups.add_user(group_id="7f08f1f1fc910bf1f25274aef11d27", user_id="0abed8dfcc039ea05e2a1d494fd442")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `group_id`                                                          | *str*                                                               | :heavy_check_mark:                                                  | The ID of the user group.                                           | 7f08f1f1fc910bf1f25274aef11d27                                      |
| `user_id`                                                           | *str*                                                               | :heavy_check_mark:                                                  | The ID of the user.                                                 | 0abed8dfcc039ea05e2a1d494fd442                                      |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.UserGroupUser](../../models/usergroupuser.md)**

### Errors

| Error Type                        | Status Code                       | Content Type                      |
| --------------------------------- | --------------------------------- | --------------------------------- |
| models.ErrorResponse              | 400, 401, 403, 404, 409, 420, 429 | application/json                  |
| models.APIError                   | 4XX, 5XX                          | \*/\*                             |

## remove_user

Remove a user from a group with the specified ID.

Learn more about removing users from a specific user group.
<https://cloudinary.com/documentation/provisioning_api#remove_user_from_group>

### Example Usage

<!-- UsageSnippet language="python" operationID="removeUserFromUserGroup" method="delete" path="/v1_1/provisioning/accounts/{account_id}/user_groups/{group_id}/users/{user_id}" example="UserGroupUsers" -->
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

    res = cld_provisioning.user_groups.remove_user(group_id="7f08f1f1fc910bf1f25274aef11d27", user_id="0abed8dfcc039ea05e2a1d494fd442")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `group_id`                                                          | *str*                                                               | :heavy_check_mark:                                                  | The ID of the user group.                                           | 7f08f1f1fc910bf1f25274aef11d27                                      |
| `user_id`                                                           | *str*                                                               | :heavy_check_mark:                                                  | The ID of the user.                                                 | 0abed8dfcc039ea05e2a1d494fd442                                      |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.UserGroupUsersResponse](../../models/usergroupusersresponse.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| models.ErrorResponse         | 400, 401, 403, 404, 420, 429 | application/json             |
| models.APIError              | 4XX, 5XX                     | \*/\*                        |
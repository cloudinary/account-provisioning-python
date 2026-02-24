# Cloudinary Account Provisioning Python SDK

Developer-friendly & type-safe Python SDK specifically catered to leverage *cloudinary-account-provisioning* API.

<!-- Start Summary [summary] -->
## Summary

Cloudinary Account Provisioning API: Accounts with provisioning API access can create and manage their **product environments**, **users** and **user groups** using the RESTful Provisioning API.

Provisioning API access is available [upon request](https://cloudinary.com/contact?plan=enterprise) for accounts on an [Enterprise plan](https://cloudinary.com/pricing#pricing-enterprise).

The API uses **Basic Authentication** over HTTPS. Your **Account API Key** and **Account API Secret** (previously referred to as **Provisioning API keys**) are used for the authentication. These credentials (as well as your ACCOUNT_ID) are located in the [Cloudinary Console](https://console.cloudinary.com/pm) under **Settings > Account API Keys**.

The Provisioning API has dedicated SDKs for the following languages:

* [JavaScript](https://github.com/cloudinary/account-provisioning-js)
* [PHP](https://github.com/cloudinary/account-provisioning-php)
* [Java](https://github.com/cloudinary/account-provisioning-java)

Useful links:
* [Provisioning API reference (Classic)](https://cloudinary.com/documentation/provisioning_api_1) (includes SDKs for additional languages)

Accounts with Permissions API access can assign roles, made up of system policies, to control what principals (users, groups, and API keys) can do across the Cloudinary account and product environments. For more information about Cloudinary roles and permissions, see the [Role-based permissions](https://github.com/cloudinary/account-provisioning-python/blob/master/permissions_overview) guide.

Permissions API access is available [upon request](https://cloudinary.com/contact?plan=enterprise) for accounts on an [Enterprise plan](https://cloudinary.com/pricing#pricing-enterprise).

The API uses **Basic Authentication** over HTTPS. Your **Account API Key** and **Account API Secret** (previously referred to as **Provisioning API keys**) are used for the authentication. These credentials (as well as your ACCOUNT_ID) are located in the [Cloudinary Console](https://console.cloudinary.com/app/settings/account-api-keys) under **Settings > Account API Keys**.

_**Important:**_

_Cloudinary's **Roles and Permissions Management** is now available as a **Beta**. This is an early stage release, and while it's functional and ready for real-world testing, it's subject to change as we continue refining the experience based on what we learn, including your feedback.
During the Beta period, core functionality is considered stable, though some APIs, scopes, or response formats may evolve._

_**How you can help:**_

* _Use Roles and Permissions Management in real projects, prototypes, or tests._
* _Share feedback, issues, or ideas with our support team._

_Thank you for exploring this early release and helping us shape these tools to best meet your needs._
<!-- End Summary [summary] -->

<!-- Start Table of Contents [toc] -->
## Table of Contents
<!-- $toc-max-depth=2 -->
* [Cloudinary Account Provisioning Python SDK](https://github.com/cloudinary/account-provisioning-python/blob/master/#cloudinary-account-provisioning-python-sdk)
  * [SDK Installation](https://github.com/cloudinary/account-provisioning-python/blob/master/#sdk-installation)
  * [IDE Support](https://github.com/cloudinary/account-provisioning-python/blob/master/#ide-support)
  * [SDK Example Usage](https://github.com/cloudinary/account-provisioning-python/blob/master/#sdk-example-usage)
  * [Authentication](https://github.com/cloudinary/account-provisioning-python/blob/master/#authentication)
  * [Available Resources and Operations](https://github.com/cloudinary/account-provisioning-python/blob/master/#available-resources-and-operations)
  * [Global Parameters](https://github.com/cloudinary/account-provisioning-python/blob/master/#global-parameters)
  * [Retries](https://github.com/cloudinary/account-provisioning-python/blob/master/#retries)
  * [Error Handling](https://github.com/cloudinary/account-provisioning-python/blob/master/#error-handling)
  * [Server Selection](https://github.com/cloudinary/account-provisioning-python/blob/master/#server-selection)
  * [Custom HTTP Client](https://github.com/cloudinary/account-provisioning-python/blob/master/#custom-http-client)
  * [Resource Management](https://github.com/cloudinary/account-provisioning-python/blob/master/#resource-management)
  * [Debugging](https://github.com/cloudinary/account-provisioning-python/blob/master/#debugging)
* [Development](https://github.com/cloudinary/account-provisioning-python/blob/master/#development)
  * [Maturity](https://github.com/cloudinary/account-provisioning-python/blob/master/#maturity)
  * [Contributions](https://github.com/cloudinary/account-provisioning-python/blob/master/#contributions)

<!-- End Table of Contents [toc] -->

<!-- Start SDK Installation [installation] -->
## SDK Installation

> [!TIP]
> To finish publishing your SDK to PyPI you must [run your first generation action](https://www.speakeasy.com/docs/github-setup#step-by-step-guide).


> [!NOTE]
> **Python version upgrade policy**
>
> Once a Python version reaches its [official end of life date](https://devguide.python.org/versions/), a 3-month grace period is provided for users to upgrade. Following this grace period, the minimum python version supported in the SDK will be updated.

The SDK can be installed with *uv*, *pip*, or *poetry* package managers.

### uv

*uv* is a fast Python package installer and resolver, designed as a drop-in replacement for pip and pip-tools. It's recommended for its speed and modern Python tooling capabilities.

```bash
uv add git+https://github.com/cloudinary/account-provisioning-python.git
```

### PIP

*PIP* is the default package installer for Python, enabling easy installation and management of packages from PyPI via the command line.

```bash
pip install git+https://github.com/cloudinary/account-provisioning-python.git
```

### Poetry

*Poetry* is a modern tool that simplifies dependency management and package publishing by using a single `pyproject.toml` file to handle project metadata and dependencies.

```bash
poetry add git+https://github.com/cloudinary/account-provisioning-python.git
```

### Shell and script usage with `uv`

You can use this SDK in a Python shell with [uv](https://docs.astral.sh/uv/) and the `uvx` command that comes with it like so:

```shell
uvx --from cloudinary-account-provisioning python
```

It's also possible to write a standalone Python script without needing to set up a whole project like so:

```python
#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.10"
# dependencies = [
#     "cloudinary-account-provisioning",
# ]
# ///

from cloudinary_account_provisioning import CldProvisioning

sdk = CldProvisioning(
  # SDK arguments
)

# Rest of script here...
```

Once that is saved to a file, you can run it with `uv run script.py` where
`script.py` can be replaced with the actual file name.
<!-- End SDK Installation [installation] -->

<!-- Start IDE Support [idesupport] -->
## IDE Support

### PyCharm

Generally, the SDK will work well with most IDEs out of the box. However, when using PyCharm, you can enjoy much better integration with Pydantic by installing an additional plugin.

- [PyCharm Pydantic Plugin](https://docs.pydantic.dev/latest/integrations/pycharm/)
<!-- End IDE Support [idesupport] -->

<!-- Start SDK Example Usage [usage] -->
## SDK Example Usage

### Example

```python
# Synchronous Example
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

</br>

The same SDK client can also be used to make asynchronous requests by importing asyncio.

```python
# Asynchronous Example
import asyncio
import cloudinary_account_provisioning
from cloudinary_account_provisioning import CldProvisioning

async def main():

    async with CldProvisioning(
        account_id="<id>",
        security=cloudinary_account_provisioning.Security(
            provisioning_api_key="CLOUDINARY_PROVISIONING_API_KEY",
            provisioning_api_secret="CLOUDINARY_PROVISIONING_API_SECRET",
        ),
    ) as cld_provisioning:

        res = await cld_provisioning.product_environments.list_async(enabled=True, prefix="product")

        # Handle response
        print(res)

asyncio.run(main())
```
<!-- End SDK Example Usage [usage] -->

<!-- Start Authentication [security] -->
## Authentication

### Per-Client Security Schemes

This SDK supports the following security scheme globally:

| Name                                                 | Type | Scheme      | Environment Variable                                                       |
| ---------------------------------------------------- | ---- | ----------- | -------------------------------------------------------------------------- |
| `provisioning_api_key`<br/>`provisioning_api_secret` | http | Custom HTTP | `CLOUDINARY_PROVISIONING_API_KEY`<br/>`CLOUDINARY_PROVISIONING_API_SECRET` |

You can set the security parameters through the `security` optional parameter when initializing the SDK client instance. For example:
```python
import cloudinary_account_provisioning
from cloudinary_account_provisioning import CldProvisioning


with CldProvisioning(
    security=cloudinary_account_provisioning.Security(
        provisioning_api_key="CLOUDINARY_PROVISIONING_API_KEY",
        provisioning_api_secret="CLOUDINARY_PROVISIONING_API_SECRET",
    ),
    account_id="<id>",
) as cld_provisioning:

    res = cld_provisioning.product_environments.list(enabled=True, prefix="product")

    # Handle response
    print(res)

```
<!-- End Authentication [security] -->

<!-- Start Available Resources and Operations [operations] -->
## Available Resources and Operations

<details open>
<summary>Available methods</summary>

### [AccessKeys](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/accesskeys/README.md)

* [list](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/accesskeys/README.md#list) - Get access keys
* [generate](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/accesskeys/README.md#generate) - Generate an access key
* [delete_by_name](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/accesskeys/README.md#delete_by_name) - Delete access key by name
* [update](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/accesskeys/README.md#update) - Update an access key
* [delete](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/accesskeys/README.md#delete) - Delete access key

### [BillingUsage](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/billingusage/README.md)

* [get](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/billingusage/README.md#get) - Get billing usage information

### [CustomPolicies](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/custompolicies/README.md)

* [list](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/custompolicies/README.md#list) - Get custom policies
* [create](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/custompolicies/README.md#create) - Create custom policy
* [get](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/custompolicies/README.md#get) - Get custom policy
* [update](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/custompolicies/README.md#update) - Update custom policy
* [delete](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/custompolicies/README.md#delete) - Delete custom policy

### [EffectivePolicies](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/effectivepolicies/README.md)

* [list](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/effectivepolicies/README.md#list) - Get effective policies

### [Principals](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/principals/README.md)

* [list_roles](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/principals/README.md#list_roles) - Get a principal's roles
* [update_roles](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/principals/README.md#update_roles) - Assign roles to a principal
* [inspect](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/principals/README.md#inspect) - Inspect
* [inspect_multiple](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/principals/README.md#inspect_multiple) - Inspect multiple

### [ProductEnvironments](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/productenvironments/README.md)

* [list](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/productenvironments/README.md#list) - Get product environments
* [create](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/productenvironments/README.md#create) - Create product environment
* [get](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/productenvironments/README.md#get) - Get product environment
* [update](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/productenvironments/README.md#update) - Update product environment
* [delete](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/productenvironments/README.md#delete) - Delete product environment

### [Public](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/public/README.md)

* [get_catalog](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/public/README.md#get_catalog) - Get system roles and policies catalog
* [validate_policy](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/public/README.md#validate_policy) - Validate a Cedar policy
* [get_schema](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/public/README.md#get_schema) - Get Cedar schema

### [Roles](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/roles/README.md)

* [list](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/roles/README.md#list) - Get roles
* [create](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/roles/README.md#create) - Create custom role
* [get](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/roles/README.md#get) - Get role
* [update](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/roles/README.md#update) - Update custom role
* [delete](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/roles/README.md#delete) - Delete custom role
* [list_principals](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/roles/README.md#list_principals) - Get a role's principals
* [update_principals](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/roles/README.md#update_principals) - Assign principals to a role

### [SystemPolicies](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/systempolicies/README.md)

* [list](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/systempolicies/README.md#list) - Get system policies

### [UserGroups](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/usergroups/README.md)

* [list](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/usergroups/README.md#list) - Get User Groups
* [create](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/usergroups/README.md#create) - Create User Group
* [get](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/usergroups/README.md#get) - Get User Group
* [update](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/usergroups/README.md#update) - Update User Group
* [delete](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/usergroups/README.md#delete) - Delete User Group
* [list_users](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/usergroups/README.md#list_users) - Get Users in User Group
* [add_user](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/usergroups/README.md#add_user) - Add User to User Group
* [remove_user](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/usergroups/README.md#remove_user) - Remove User from User Group

### [Users](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/users/README.md)

* [list](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/users/README.md#list) - Get users
* [create](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/users/README.md#create) - Create user
* [get](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/users/README.md#get) - Get user
* [update](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/users/README.md#update) - Update user
* [delete](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/users/README.md#delete) - Delete user
* [get_groups](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/users/README.md#get_groups) - Get user groups
* [list_sub_accounts](https://github.com/cloudinary/account-provisioning-python/blob/master/docs/sdks/users/README.md#list_sub_accounts) - Get user sub-accounts

</details>
<!-- End Available Resources and Operations [operations] -->

<!-- Start Global Parameters [global-parameters] -->
## Global Parameters

A parameter is configured globally. This parameter may be set on the SDK client instance itself during initialization. When configured as an option during SDK initialization, This global value will be used as the default on the operations that use it. When such operations are called, there is a place in each to override the global value, if needed.

For example, you can set `account_id` to `"<id>"` at SDK initialization and then you do not have to pass the same value on calls to operations like `list`. But if you want to do so you may, which will locally override the global setting. See the example code below for a demonstration.


### Available Globals

The following global parameter is available.
Global parameters can also be set via environment variable.

| Name       | Type | Description | Environment           |
| ---------- | ---- | ----------- | --------------------- |
| account_id | str  | Account ID  | CLOUDINARY_ACCOUNT_ID |

### Example

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
<!-- End Global Parameters [global-parameters] -->

<!-- Start Retries [retries] -->
## Retries

Some of the endpoints in this SDK support retries. If you use the SDK without any configuration, it will fall back to the default retry strategy provided by the API. However, the default retry strategy can be overridden on a per-operation basis, or across the entire SDK.

To change the default retry strategy for a single API call, simply provide a `RetryConfig` object to the call:
```python
import cloudinary_account_provisioning
from cloudinary_account_provisioning import CldProvisioning
from cloudinary_account_provisioning.utils import BackoffStrategy, RetryConfig


with CldProvisioning(
    account_id="<id>",
    security=cloudinary_account_provisioning.Security(
        provisioning_api_key="CLOUDINARY_PROVISIONING_API_KEY",
        provisioning_api_secret="CLOUDINARY_PROVISIONING_API_SECRET",
    ),
) as cld_provisioning:

    res = cld_provisioning.product_environments.list(enabled=True, prefix="product",
        RetryConfig("backoff", BackoffStrategy(1, 50, 1.1, 100), False))

    # Handle response
    print(res)

```

If you'd like to override the default retry strategy for all operations that support retries, you can use the `retry_config` optional parameter when initializing the SDK:
```python
import cloudinary_account_provisioning
from cloudinary_account_provisioning import CldProvisioning
from cloudinary_account_provisioning.utils import BackoffStrategy, RetryConfig


with CldProvisioning(
    retry_config=RetryConfig("backoff", BackoffStrategy(1, 50, 1.1, 100), False),
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
<!-- End Retries [retries] -->

<!-- Start Error Handling [errors] -->
## Error Handling

[`CloudinaryError`](https://github.com/cloudinary/account-provisioning-python/blob/master/./src/cloudinary_account_provisioning/models/cloudinaryerror.py) is the base class for all HTTP error responses. It has the following properties:

| Property           | Type             | Description                                                                             |
| ------------------ | ---------------- | --------------------------------------------------------------------------------------- |
| `err.message`      | `str`            | Error message                                                                           |
| `err.status_code`  | `int`            | HTTP response status code eg `404`                                                      |
| `err.headers`      | `httpx.Headers`  | HTTP response headers                                                                   |
| `err.body`         | `str`            | HTTP body. Can be empty string if no body is returned.                                  |
| `err.raw_response` | `httpx.Response` | Raw HTTP response                                                                       |
| `err.data`         |                  | Optional. Some errors may contain structured data. [See Error Classes](https://github.com/cloudinary/account-provisioning-python/blob/master/#error-classes). |

### Example
```python
import cloudinary_account_provisioning
from cloudinary_account_provisioning import CldProvisioning, models


with CldProvisioning(
    account_id="<id>",
    security=cloudinary_account_provisioning.Security(
        provisioning_api_key="CLOUDINARY_PROVISIONING_API_KEY",
        provisioning_api_secret="CLOUDINARY_PROVISIONING_API_SECRET",
    ),
) as cld_provisioning:
    res = None
    try:

        res = cld_provisioning.product_environments.list(enabled=True, prefix="product")

        # Handle response
        print(res)


    except models.CloudinaryError as e:
        # The base class for HTTP error responses
        print(e.message)
        print(e.status_code)
        print(e.body)
        print(e.headers)
        print(e.raw_response)

        # Depending on the method different errors may be thrown
        if isinstance(e, models.ErrorResponse):
            print(e.data.error)  # Optional[cloudinary_account_provisioning.Error]
```

### Error Classes
**Primary error:**
* [`CloudinaryError`](https://github.com/cloudinary/account-provisioning-python/blob/master/./src/cloudinary_account_provisioning/models/cloudinaryerror.py): The base class for HTTP error responses.

<details><summary>Less common errors (7)</summary>

<br />

**Network errors:**
* [`httpx.RequestError`](https://www.python-httpx.org/exceptions/#httpx.RequestError): Base class for request errors.
    * [`httpx.ConnectError`](https://www.python-httpx.org/exceptions/#httpx.ConnectError): HTTP client was unable to make a request to a server.
    * [`httpx.TimeoutException`](https://www.python-httpx.org/exceptions/#httpx.TimeoutException): HTTP request timed out.


**Inherit from [`CloudinaryError`](https://github.com/cloudinary/account-provisioning-python/blob/master/./src/cloudinary_account_provisioning/models/cloudinaryerror.py)**:
* [`ErrorResponse`](https://github.com/cloudinary/account-provisioning-python/blob/master/./src/cloudinary_account_provisioning/models/errorresponse.py): Bad request. Applicable to 26 of 47 methods.*
* [`PermissionsErrorResponse`](https://github.com/cloudinary/account-provisioning-python/blob/master/./src/cloudinary_account_provisioning/models/permissionserrorresponse.py): Applicable to 18 of 47 methods.*
* [`ResponseValidationError`](https://github.com/cloudinary/account-provisioning-python/blob/master/./src/cloudinary_account_provisioning/models/responsevalidationerror.py): Type mismatch between the response data and the expected Pydantic model. Provides access to the Pydantic validation error via the `cause` attribute.

</details>

\* Check [the method documentation](https://github.com/cloudinary/account-provisioning-python/blob/master/#available-resources-and-operations) to see if the error is applicable.
<!-- End Error Handling [errors] -->

<!-- Start Server Selection [server] -->
## Server Selection

### Select Server by Index

You can override the default server globally by passing a server index to the `server_idx: int` optional parameter when initializing the SDK client instance. The selected server will then be used as the default on the operations that use it. This table lists the indexes associated with the available servers:

| #   | Server                            | Variables | Description                                     |
| --- | --------------------------------- | --------- | ----------------------------------------------- |
| 0   | `https://{region}.cloudinary.com` | `region`  | Regional API endpoints for optimal performance. |
| 1   | `https://{host}`                  | `host`    | Custom domains for enterprise deployments.      |

If the selected server has variables, you may override its default values through the additional parameters made available in the SDK constructor:

| Variable | Parameter                     | Supported Values                            | Default                | Description                 |
| -------- | ----------------------------- | ------------------------------------------- | ---------------------- | --------------------------- |
| `region` | `region: models.ServerRegion` | - `"api"`<br/>- `"api-eu"`<br/>- `"api-ap"` | `"api"`                | Regional endpoint selection |
| `host`   | `host: str`                   | str                                         | `"api.cloudinary.com"` | API host domain.            |

#### Example

```python
import cloudinary_account_provisioning
from cloudinary_account_provisioning import CldProvisioning


with CldProvisioning(
    server_idx=0,
    region="api-ap",
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

### Override Server URL Per-Client

The default server can also be overridden globally by passing a URL to the `server_url: str` optional parameter when initializing the SDK client instance. For example:
```python
import cloudinary_account_provisioning
from cloudinary_account_provisioning import CldProvisioning


with CldProvisioning(
    server_url="https://api.cloudinary.com",
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
<!-- End Server Selection [server] -->

<!-- Start Custom HTTP Client [http-client] -->
## Custom HTTP Client

The Python SDK makes API calls using the [httpx](https://www.python-httpx.org/) HTTP library.  In order to provide a convenient way to configure timeouts, cookies, proxies, custom headers, and other low-level configuration, you can initialize the SDK client with your own HTTP client instance.
Depending on whether you are using the sync or async version of the SDK, you can pass an instance of `HttpClient` or `AsyncHttpClient` respectively, which are Protocol's ensuring that the client has the necessary methods to make API calls.
This allows you to wrap the client with your own custom logic, such as adding custom headers, logging, or error handling, or you can just pass an instance of `httpx.Client` or `httpx.AsyncClient` directly.

For example, you could specify a header for every request that this sdk makes as follows:
```python
from cloudinary_account_provisioning import CldProvisioning
import httpx

http_client = httpx.Client(headers={"x-custom-header": "someValue"})
s = CldProvisioning(client=http_client)
```

or you could wrap the client with your own custom logic:
```python
from cloudinary_account_provisioning import CldProvisioning
from cloudinary_account_provisioning.httpclient import AsyncHttpClient
import httpx

class CustomClient(AsyncHttpClient):
    client: AsyncHttpClient

    def __init__(self, client: AsyncHttpClient):
        self.client = client

    async def send(
        self,
        request: httpx.Request,
        *,
        stream: bool = False,
        auth: Union[
            httpx._types.AuthTypes, httpx._client.UseClientDefault, None
        ] = httpx.USE_CLIENT_DEFAULT,
        follow_redirects: Union[
            bool, httpx._client.UseClientDefault
        ] = httpx.USE_CLIENT_DEFAULT,
    ) -> httpx.Response:
        request.headers["Client-Level-Header"] = "added by client"

        return await self.client.send(
            request, stream=stream, auth=auth, follow_redirects=follow_redirects
        )

    def build_request(
        self,
        method: str,
        url: httpx._types.URLTypes,
        *,
        content: Optional[httpx._types.RequestContent] = None,
        data: Optional[httpx._types.RequestData] = None,
        files: Optional[httpx._types.RequestFiles] = None,
        json: Optional[Any] = None,
        params: Optional[httpx._types.QueryParamTypes] = None,
        headers: Optional[httpx._types.HeaderTypes] = None,
        cookies: Optional[httpx._types.CookieTypes] = None,
        timeout: Union[
            httpx._types.TimeoutTypes, httpx._client.UseClientDefault
        ] = httpx.USE_CLIENT_DEFAULT,
        extensions: Optional[httpx._types.RequestExtensions] = None,
    ) -> httpx.Request:
        return self.client.build_request(
            method,
            url,
            content=content,
            data=data,
            files=files,
            json=json,
            params=params,
            headers=headers,
            cookies=cookies,
            timeout=timeout,
            extensions=extensions,
        )

s = CldProvisioning(async_client=CustomClient(httpx.AsyncClient()))
```
<!-- End Custom HTTP Client [http-client] -->

<!-- Start Resource Management [resource-management] -->
## Resource Management

The `CldProvisioning` class implements the context manager protocol and registers a finalizer function to close the underlying sync and async HTTPX clients it uses under the hood. This will close HTTP connections, release memory and free up other resources held by the SDK. In short-lived Python programs and notebooks that make a few SDK method calls, resource management may not be a concern. However, in longer-lived programs, it is beneficial to create a single SDK instance via a [context manager][context-manager] and reuse it across the application.

[context-manager]: https://docs.python.org/3/reference/datamodel.html#context-managers

```python
import cloudinary_account_provisioning
from cloudinary_account_provisioning import CldProvisioning
def main():

    with CldProvisioning(
        account_id="<id>",
        security=cloudinary_account_provisioning.Security(
            provisioning_api_key="CLOUDINARY_PROVISIONING_API_KEY",
            provisioning_api_secret="CLOUDINARY_PROVISIONING_API_SECRET",
        ),
    ) as cld_provisioning:
        # Rest of application here...


# Or when using async:
async def amain():

    async with CldProvisioning(
        account_id="<id>",
        security=cloudinary_account_provisioning.Security(
            provisioning_api_key="CLOUDINARY_PROVISIONING_API_KEY",
            provisioning_api_secret="CLOUDINARY_PROVISIONING_API_SECRET",
        ),
    ) as cld_provisioning:
        # Rest of application here...
```
<!-- End Resource Management [resource-management] -->

<!-- Start Debugging [debug] -->
## Debugging

You can setup your SDK to emit debug logs for SDK requests and responses.

You can pass your own logger class directly into your SDK.
```python
from cloudinary_account_provisioning import CldProvisioning
import logging

logging.basicConfig(level=logging.DEBUG)
s = CldProvisioning(debug_logger=logging.getLogger("cloudinary_account_provisioning"))
```

You can also enable a default debug logger by setting an environment variable `CLOUDINARY_DEBUG` to true.
<!-- End Debugging [debug] -->

<!-- Placeholder for Future Speakeasy SDK Sections -->

# Development

## Maturity

This SDK is in beta, and there may be breaking changes between versions without a major version update. Therefore, we recommend pinning usage
to a specific package version. This way, you can install the same version each time without breaking changes unless you are intentionally
looking for the latest version.

## Contributions

While we value open-source contributions to this SDK, this library is generated programmatically. Any manual changes added to internal files will be overwritten on the next generation.
We look forward to hearing your feedback. Feel free to open a PR or an issue with a proof of concept and we'll do our best to include it in a future release.

### SDK Created by [Speakeasy](https://www.speakeasy.com/?utm_source=cloudinary-account-provisioning&utm_campaign=python)

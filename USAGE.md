<!-- Start SDK Example Usage [usage] -->
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
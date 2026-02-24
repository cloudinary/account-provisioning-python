import base64

import httpx
from typing import Union

from .cloudinary_config import _account_config
from .types import BeforeRequestContext, BeforeRequestHook, SDKInitHook
from ..sdkconfiguration import SDKConfiguration


class CloudinaryAccountHook(SDKInitHook, BeforeRequestHook):

    def sdk_init(self, config: SDKConfiguration) -> SDKConfiguration:
        # Populate account_id from CLOUDINARY_ACCOUNT_URL if not explicitly provided
        if not config.globals.account_id and _account_config.account_id:
            config.globals.account_id = _account_config.account_id

        return config

    def before_request(
        self, hook_ctx: BeforeRequestContext, request: httpx.Request
    ) -> Union[httpx.Request, Exception]:
        security = hook_ctx.security_source
        if callable(security):
            security = security()

        # Check for nested cloudinary_account_auth security format
        auth_obj = getattr(security, "cloudinary_account_auth", None) if security is not None else None
        if auth_obj is not None:
            provisioning_api_key = getattr(auth_obj, "provisioning_api_key", None)
            provisioning_api_secret = getattr(auth_obj, "provisioning_api_secret", None)
        else:
            # Fall back to flat attributes on the security object
            provisioning_api_key = getattr(security, "provisioning_api_key", None) if security is not None else None
            provisioning_api_secret = getattr(security, "provisioning_api_secret", None) if security is not None else None

        # Fall back to environment config (CLOUDINARY_ACCOUNT_URL or CLOUDINARY_ACCOUNT_* vars)
        if not provisioning_api_key:
            provisioning_api_key = _account_config.provisioning_api_key
        if not provisioning_api_secret:
            provisioning_api_secret = _account_config.provisioning_api_secret

        if not provisioning_api_key or not provisioning_api_secret:
            raise Exception("Provisioning API key and secret are required")

        data = f"{provisioning_api_key}:{provisioning_api_secret}".encode()
        request.headers["Authorization"] = f"Basic {base64.b64encode(data).decode()}"

        return request

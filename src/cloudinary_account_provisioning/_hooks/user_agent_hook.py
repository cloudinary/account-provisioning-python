import platform
import re
import sys

from .types import SDKInitHook
from ..sdkconfiguration import SDKConfiguration


def _get_product_name(package_name: str) -> str:
    match = re.search(r"cloudinary[_-](.+)", package_name)
    if match:
        return "".join(
            word.capitalize() for word in re.split(r"[_-]", match.group(1))
        )
    return "Unknown"


def _get_system_info() -> str:
    py_version = f"{sys.version_info.major}.{sys.version_info.minor}.{sys.version_info.micro}"
    os_name = platform.system()
    arch = platform.machine()
    return f"Python {py_version}; {os_name} {arch}"


def _build_user_agent(
    sdk_version: str,
    gen_version: str,
    openapi_doc_version: str,
    package_name: str,
) -> str:
    product_name = _get_product_name(package_name)
    system_info = _get_system_info()
    return f"Cloudinary/{product_name} Python/{sdk_version} Gen/{gen_version} Schema/{openapi_doc_version} ({system_info})"


class UserAgentHook(SDKInitHook):
    def sdk_init(self, config: SDKConfiguration) -> SDKConfiguration:
        original = config.user_agent
        if original and original.startswith("speakeasy-sdk/"):
            parts = original.split(" ")
            if len(parts) >= 5:
                sdk_version = parts[1]
                gen_version = parts[2]
                openapi_doc_version = parts[3]
                package_name = parts[4]
                config.user_agent = _build_user_agent(
                    sdk_version, gen_version, openapi_doc_version, package_name
                )
        return config

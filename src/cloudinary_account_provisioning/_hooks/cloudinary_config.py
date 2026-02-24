from __future__ import absolute_import
import os
from urllib.parse import urlparse, parse_qs


class BaseConfig:
    """Base configuration class with environment and URL parsing support."""

    _uri_scheme: str
    _env_prefix: str
    _env_url_key: str

    def __init__(self):
        self._load_config_from_env()

    def __getattr__(self, name):
        return self.__dict__.get(name)

    def _load_from_url(self, url):
        """Parse URL and extract configuration."""
        parsed_url = urlparse(url)
        if parsed_url.scheme.lower() != self._uri_scheme:
            raise ValueError(f"Invalid URL scheme. Expecting '{self._uri_scheme}://'")

        conf = self._config_from_parsed_url(parsed_url)
        self.update(**conf)

        # Process query parameters
        for key, value in parse_qs(parsed_url.query).items():
            self.__dict__[key] = value[0]

    def update(self, **kwargs):
        """Update configuration with provided key-value pairs."""
        self.__dict__.update(kwargs)

    def _load_config_from_env(self):
        """Load configuration from environment variables or URL."""
        env_url = os.environ.get(self._env_url_key)
        if env_url:
            self._load_from_url(env_url)
        else:
            self._load_from_env_variables()

    def _load_from_env_variables(self):
        """Load configuration from individual environment variables."""
        for key, value in os.environ.items():
            if key.startswith(self._env_prefix) and key != self._env_url_key:
                conf_key = key[len(self._env_prefix):].lower()
                self.update(**{conf_key: value.lower() == "true" if value.lower() in ["true", "false"] else value})

    def _config_from_parsed_url(self, parsed_url):
        """Extract configuration from parsed URL."""
        raise NotImplementedError("Subclasses must implement this method")


class CloudConfig(BaseConfig):
    """Configuration class for managing Cloudinary settings."""

    _uri_scheme = "cloudinary"
    _env_prefix = "CLOUDINARY_"
    _env_url_key = "CLOUDINARY_URL"

    def _config_from_parsed_url(self, parsed_url):
        """Extract Cloudinary-specific configuration from a parsed URL."""
        is_private_cdn = bool(parsed_url.path)
        conf = {
            "cloud_name": parsed_url.hostname,
            "api_key": parsed_url.username,
            "api_secret": parsed_url.password,
            "private_cdn": is_private_cdn,
        }
        if is_private_cdn:
            conf["secure_distribution"] = parsed_url.path.lstrip("/")
        return conf


class AccountConfig(BaseConfig):
    """Configuration class for managing Cloudinary account settings."""

    _uri_scheme = "account"
    _env_prefix = "CLOUDINARY_ACCOUNT_"
    _env_url_key = "CLOUDINARY_ACCOUNT_URL"

    def _config_from_parsed_url(self, parsed_url):
        """Extract account-specific configuration from a parsed URL."""
        return {
            "account_id": parsed_url.hostname,
            "provisioning_api_key": parsed_url.username,
            "provisioning_api_secret": parsed_url.password,
        }


def cloud_config(**keywords):
    _cloud_config.update(**keywords)
    return _cloud_config


def account_config(**keywords):
    _account_config.update(**keywords)
    return _account_config


def reset_config():
    global _account_config, _cloud_config  # pylint: disable=global-statement
    _account_config = AccountConfig()
    _cloud_config = CloudConfig()


_cloud_config = CloudConfig()
_account_config = AccountConfig()

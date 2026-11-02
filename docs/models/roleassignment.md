# RoleAssignment

A role assignment with optional scope and policy parameters.


## Fields

| Field                                                              | Type                                                               | Required                                                           | Description                                                        | Example                                                            |
| ------------------------------------------------------------------ | ------------------------------------------------------------------ | ------------------------------------------------------------------ | ------------------------------------------------------------------ | ------------------------------------------------------------------ |
| `id`                                                               | *str*                                                              | :heavy_check_mark:                                                 | The role ID.                                                       | media_library_admin                                                |
| `scope_id`                                                         | *Optional[str]*                                                    | :heavy_minus_sign:                                                 | The scope (product environment) ID the role applies to.            |                                                                    |
| `policy_parameters`                                                | [Optional[models.PolicyParameters]](../models/policyparameters.md) | :heavy_minus_sign:                                                 | Optional content-scope policy parameters.                          |                                                                    |
| `__pydantic_extra__`                                               | Dict[str, *Any*]                                                   | :heavy_minus_sign:                                                 | N/A                                                                |                                                                    |
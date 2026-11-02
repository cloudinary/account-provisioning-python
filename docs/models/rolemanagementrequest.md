# RoleManagementRequest

A role management operation and the roles it applies to.


## Fields

| Field                                                      | Type                                                       | Required                                                   | Description                                                | Example                                                    |
| ---------------------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------- |
| `operation`                                                | [models.Operation](../models/operation.md)                 | :heavy_check_mark:                                         | Whether to add or remove the listed roles.                 | add                                                        |
| `roles`                                                    | List[[models.RoleAssignment](../models/roleassignment.md)] | :heavy_check_mark:                                         | The roles to add or remove.                                |                                                            |
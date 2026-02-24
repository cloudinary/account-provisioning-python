# MetricUsage


## Fields

| Field                                                                        | Type                                                                         | Required                                                                     | Description                                                                  |
| ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `metric`                                                                     | *Optional[str]*                                                              | :heavy_minus_sign:                                                           | The type of metric being measured (e.g., "credit").                          |
| `limit`                                                                      | *Optional[float]*                                                            | :heavy_minus_sign:                                                           | The limit for this metric in the plan.                                       |
| `cycles`                                                                     | List[[models.Cycles](../models/cycles.md)]                                   | :heavy_minus_sign:                                                           | Full usage details per billing cycle (monthly or annual, depending on plan). |
| `monthly_cycles`                                                             | List[[models.MonthlyCycles](../models/monthlycycles.md)]                     | :heavy_minus_sign:                                                           | Monthly-level breakdown within a single annual cycle.                        |
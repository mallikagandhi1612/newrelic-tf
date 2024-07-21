api_key = "NRAK-FHKRNTXMEACHLUC4ONZ2E1XF2ZC"
app_name = "FoodMe-test"
account_id        = "4438266"
policy_name = "my-policy-123"
alert_conditions = {
  condition_1 = {
    condition_name              = "Condition 1"
    metric                      = "metric_1"
    threshold                   = 10
    duration_minutes            = 5
    type                        = "static"
    violation_time_limit_seconds = 300
    fill_option                 = "none"
    fill_value                  = 0
    aggregation_window          = 60
    aggregation_method          = "EVENT_FLOW"
    aggregation_delay           = 5
    expiration_duration         = 3600
    slide_by                    = 30
  }
}
# data "newrelic_entity" "app" {
#   name = var.app_name
#   type = "APPLICATION"
#   domain = "APM"
# }

# resource "newrelic_alert_policy" "alert-1" {
#   name = var.policy_name
# }

# resource "newrelic_alert_condition" "alert-1" {
#   policy_id = newrelic_alert_policy.alert-1.id

#   name        = var.condition_name
#   type        = "apm_app_metric"
#   entities    = [data.newrelic_entity.app.application_id]
#   metric      = var.metric
#   condition_scope = "application"

#   term {
#     duration      = var.duration_minutes
#     operator      = "below"
#     priority      = "critical"
#     threshold     = var.threshold
#     time_function = "all"
#   }
# }

resource "newrelic_alert_policy" "alert-2" {
  name = var.policy_name
}

resource "newrelic_nrql_alert_condition" "alert-2" {
  for_each                       = var.alert_conditions
  account_id                     = var.account_id
  policy_id                      = newrelic_alert_policy.alert-2.id
  type                           = each.value.type
  name                           = each.value.condition_name
  description                    = "Alert when transactions are taking too long"
  enabled                        = true
  violation_time_limit_seconds   = each.value.violation_time_limit_seconds
  fill_option                    = each.value.fill_option
  fill_value                     = each.value.fill_value
  aggregation_window             = each.value.aggregation_window
  aggregation_method             = each.value.aggregation_method
  aggregation_delay              = each.value.aggregation_delay
  expiration_duration            = each.value.expiration_duration
  open_violation_on_expiration   = true
  close_violations_on_expiration = true
  slide_by                       = each.value.slide_by

  nrql {
    query = "SELECT average(duration) FROM Transaction where appName = 'FoodMe-test'"
  }

  critical {
    operator              = "above"
    threshold             = 5.5
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }

  warning {
    operator              = "above"
    threshold             = 3.5
    threshold_duration    = 600
    threshold_occurrences = "ALL"
  }
}
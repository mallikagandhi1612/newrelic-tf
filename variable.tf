variable "app_name" {
    description = "Name of the New Relic app"
    type=string
  
}
variable "account_id" {
  description = "New Relic account ID"
  type        = string
}

variable "api_key" {
  type = string
  description = "New Relic API key"
}

variable "policy_name" {
  type = string
  description = "Name of the New Relic policy"
}

variable "alert_conditions" {
  description = "Map of alert conditions"
  type = map(object({
    condition_name              = string
    metric                      = string
    threshold                   = number
    duration_minutes            = number
    type                        = string
    violation_time_limit_seconds = number
    fill_option                 = string
    fill_value                  = number
    aggregation_window          = number
    aggregation_method          = string
    aggregation_delay           = number
    expiration_duration         = number
    slide_by                    = number
  }))
}

# variable "policy_name" {
#   description = "Name of the New Relic alert policy"
#   type        = string
# }

# variable "condition_name" {
#   description = "Name of the alert condition"
#   type        = string
# }

# variable "metric" {
#   description = "Metric to monitor"
#   type        = string
# }

# variable "threshold" {
#   description = "Threshold for the metric"
#   type        = number
# }

# variable "duration_minutes" {
#   description = "Duration in minutes for the threshold"
#   type        = number
# }

# variable "type" {
#     description = "type of the alert condition"
#     type = string
# }

# variable "violation_time_limit_seconds" {
#     description = "Violation time limit in seconds"
#     type = number
  
# }

# variable "fill_option" {
#   type = string
# }

# variable "fill_value" {
#   type = number
# }

# variable "aggregation_window" {
#   type = number
# }

# variable "aggregation_method" {
#   type = string
# }

# variable "aggregation_delay" {
#   type = number
# }

# variable "expiration_duration" {
#   type = number
# }


# variable "slide_by" {
#     type = number
#     description = "Slide by duration"
# }

variable "notification_email_list" {
  description = "List of email addresses for notification channels"
  type        = list(string)
}

variable "alert_policy_display_name" {
  description = "Alert policy display name"
  type        = string
}

variable "alert_policy_duration" {
  description = "Alert Policy Duration time period"
  type        = string
}
variable "alert_threshold_value" {
  description = "Threshold Value for Alert Trigger"
  type        = number
}

variable "alert_policy_filter_metric_type" {
  type = string
}

variable "alert_policy_filter_resource_type" {
  type = string
}

variable "alert_policy_filter_service_name" {
  type = string
}

variable "project" {
  description = "Identifier for the project"
  type        = string
}

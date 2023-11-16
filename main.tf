resource "google_monitoring_notification_channel" "email" {
  project = var.project
  count   = length(var.notification_email_list)

  display_name = "Email Notification Channel ${var.notification_email_list[count.index]}"
  type         = "email"

  labels = {
    email_address = var.notification_email_list[count.index]
  }
}

resource "google_monitoring_alert_policy" "alert_policy" {
  project      = var.project
  display_name = var.alert_policy_display_name
  combiner     = "OR"
  conditions {
    display_name = "Error Count Logger Alert Policy"
    condition_threshold {
      filter          = "metric.type=\"${var.alert_policy_filter_metric_type}\" AND resource.type=\"${var.alert_policy_filter_resource_type}\""
      duration        = var.alert_policy_duration
      comparison      = "COMPARISON_GT"
      threshold_value = var.alert_threshold_value
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_COUNT"
      }
    }
  }

  notification_channels = [
    for idx, _ in var.notification_email_list : google_monitoring_notification_channel.email[idx].name
  ]
}

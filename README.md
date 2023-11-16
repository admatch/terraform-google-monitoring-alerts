# Terraform Alerting Module

## Overview

This Terraform module facilitates the creation of a monitoring alerting policy on Google Cloud Monitoring. It includes the setup of notification channels, such as email, and allows for the configuration of alert conditions based on specified metrics.

## Features

- Define alerting policies with customizable conditions.
- Set up notification channels, including email, to receive alerts.
- Easily configurable for different projects and use cases.

## Usage

```hcl
module "alerting" {
  source                   = "path/to/your/module"
  project                  = "your-gcp-project"
  alert_policy_display_name = "My Alerting Policy"
  alert_policy_filter_metric_type = "compute.googleapis.com/instance/disk/write_bytes_count"
  alert_policy_filter_resource_type = "gce_instance"
  alert_policy_duration    = "300s"
  alert_threshold_value    = 1000
  notification_email_list  = ["user1@example.com", "user2@example.com"]
}

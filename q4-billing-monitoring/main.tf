# Note: Billing alerts require the AWS account root user to enable them first
# This is a template that can be used after enabling billing alerts

# SNS Topic for Billing Alerts
resource "aws_sns_topic" "billing_alerts" {
  name = "Shubh_Shukla_Billing_Alerts"
}

# SNS Topic Subscription - Replace with your email
resource "aws_sns_topic_subscription" "billing_alerts_subscription" {
  topic_arn = aws_sns_topic.billing_alerts.arn
  protocol  = "email"
  endpoint  = "your-email@example.com"  # Replace with your email
}

# CloudWatch Billing Alarm
# Note: This requires AWS Billing Alerts to be enabled in the AWS Billing Console
resource "aws_cloudwatch_metric_alarm" "billing_alarm" {
  alarm_name          = "Shubh_Shukla_Monthly_Billing_Alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "21600"  # 6 hours
  statistic           = "Maximum"
  threshold           = "100"    # $100 USD
  alarm_description   = "Monthly billing alarm when charges exceed $100"
  alarm_actions       = [aws_sns_topic.billing_alerts.arn]

  dimensions = {
    Currency = "USD"
  }

  # This is required to create the alarm, but it won't work until billing alerts are enabled
  # in the AWS Billing Console
  lifecycle {
    ignore_changes = [alarm_actions]
  }
}

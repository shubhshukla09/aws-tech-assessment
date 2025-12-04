output "sns_topic_arn" {
  description = "The ARN of the SNS topic for billing alerts"
  value       = aws_sns_topic.billing_alerts.arn
}

output "billing_alarm_arn" {
  description = "The ARN of the CloudWatch billing alarm"
  value       = aws_cloudwatch_metric_alarm.billing_alarm.arn
}

output "next_steps" {
  description = "Next steps to complete the billing alerts setup"
  value       = <<EOT
  
  IMPORTANT: To complete the billing alerts setup:
  1. Go to AWS Billing Console: https://console.aws.amazon.com/billing/
  2. Enable 'Receive Billing Alerts' in Preferences
  3. Check your email and confirm the SNS subscription
  4. The billing alarm will be active after confirmation
  
  EOT
}

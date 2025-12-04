variable "billing_threshold_amount" {
  description = "The threshold amount in USD for billing alerts"
  type        = number
  default     = 100
}

variable "notification_email" {
  description = "Email address to receive billing alerts"
  type        = string
  default     = "your-email@example.com"  # Replace with your email
}

variable "alarm_name_prefix" {
  description = "Prefix for the CloudWatch alarm name"
  type        = string
  default     = "Shubh_Shukla"
}

variable "currency" {
  description = "Currency for billing alerts"
  type        = string
  default     = "USD"
}

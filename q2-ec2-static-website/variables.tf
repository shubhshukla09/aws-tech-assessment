variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "your_ip" {
  description = "Your public IP address for SSH access (e.g., 123.45.67.89/32)"
  type        = string
  default     = "0.0.0.0/0"  # Change this to your actual IP for security
}

variable "key_name" {
  description = "Name of the SSH key pair to use for the EC2 instance"
  type        = string
  default     = "your-key-pair-name"  # Replace with your key pair name
}

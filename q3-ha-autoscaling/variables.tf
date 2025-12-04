variable "vpc_id" {
  description = "VPC ID from Task 1"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs from Task 1"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs from Task 1"
  type        = list(string)
}

variable "key_name" {
  description = "Name of the SSH key pair to use for EC2 instances"
  type        = string
  default     = "your-key-pair-name"  # Replace with your key pair name
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "min_size" {
  description = "Minimum number of instances in the ASG"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of instances in the ASG"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Desired number of instances in the ASG"
  type        = number
  default     = 2
}

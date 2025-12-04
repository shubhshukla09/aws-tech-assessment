# Task 3: High Availability & Auto Scaling

This Terraform configuration sets up a highly available web application using AWS Auto Scaling Group (ASG) and Application Load Balancer (ALB).

## Architecture Overview

- **Application Load Balancer (ALB)** in public subnets
- **Auto Scaling Group** in private subnets
- **Launch Template** for EC2 instances
- **Target Group** for health checks and traffic distribution
- **Security Groups** for controlling access

## Prerequisites

1. VPC with public and private subnets (from Task 1)
2. AWS CLI configured with appropriate credentials
3. Terraform installed

## Configuration

### Required Variables
Update the following variables in `terraform.tfvars` or pass them via command line:

```hcl
vpc_id           = "vpc-xxxxxxxxxxxxxxxxx"
public_subnet_ids  = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]
private_subnet_ids = ["subnet-zzzzzzzz", "subnet-wwwwwwww"]
key_name         = "your-key-pair-name"
```

## Deployment

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Review the execution plan:
   ```bash
   terraform plan
   ```

3. Apply the configuration:
   ```bash
   terraform apply
   ```

4. Access the website using the ALB DNS name (output after apply)

## Screenshots Required

1. **ALB Details** - Show the ALB configuration and listeners
2. **Target Groups** - Show healthy targets in the target group
3. **Auto Scaling Group** - Show the ASG details and instances
4. **EC2 Instances** - Show instances launched by the ASG

## Cleanup

To destroy all resources:
```bash
terraform destroy
```



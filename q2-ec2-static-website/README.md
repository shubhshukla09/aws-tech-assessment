# Task 2: EC2 Static Website Hosting

## Overview
This Terraform configuration sets up an EC2 instance running Nginx to host a static resume website. The instance is secured with a security group that allows HTTP (port 80) traffic from anywhere and SSH (port 22) access only from your IP address.

## Features
- **Nginx Web Server**: Automatically installed and configured on an Amazon Linux 2 instance
- **Security Hardening**:
  - Only allow SSH access from your specified IP address
  - Minimal open ports (only 80 and 22)
  - Automatic security updates enabled
- **Sample Resume**: A professional-looking resume template is automatically deployed
- **Cost-Effective**: Uses t2.micro instance which is eligible for AWS Free Tier

## Prerequisites
1. AWS CLI configured with appropriate credentials
2. Terraform installed on your local machine
3. An existing EC2 key pair in the specified region
4. Your public IP address (for SSH access)

## Deployment Instructions

### 1. Update Variables
Edit the `variables.tf` file to set:
- `your_ip`: Your public IP address in CIDR notation (e.g., "123.45.67.89/32")
- `key_name`: Your EC2 key pair name
- `region`: AWS region (defaults to us-east-1)

### 2. Initialize Terraform
```bash
terraform init
```

### 3. Review the Execution Plan
```bash
terraform plan
```

### 4. Apply the Configuration
```bash
terraform apply
```

### 5. Access Your Website
After deployment, Terraform will output the website URL. You can also find it in the outputs:
```bash
echo "Website URL: $(terraform output -raw website_url)"
```

## Security Hardening
- **SSH Access**: Restricted to your IP address only
- **Automatic Updates**: Enabled by default
- **Minimal Open Ports**: Only ports 80 (HTTP) and 22 (SSH) are open
- **Security Groups**: Configured with least privilege principle



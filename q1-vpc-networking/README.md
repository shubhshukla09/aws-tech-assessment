# Task 1: VPC Networking Setup

## Architecture Overview
This Terraform configuration sets up a secure and highly available VPC with public and private subnets across two availability zones. The architecture includes:
- 1 VPC (10.0.0.0/16)
- 2 Public Subnets (10.0.1.0/24, 10.0.2.0/24)
- 2 Private Subnets (10.0.3.0/24, 10.0.4/24)
- Internet Gateway for public internet access
- NAT Gateway for outbound internet access from private subnets
- Route tables for proper traffic routing

## CIDR Range Justification
- VPC: 10.0.0.0/16 provides 65,536 IP addresses, allowing for future growth
- Public Subnets: /24 (256 IPs each) provides sufficient IPs for public-facing resources
- Private Subnets: /24 (256 IPs each) provides room for application servers and databases

## How It Works
- Public subnets can directly access the internet via the Internet Gateway
- Private subnets access the internet through the NAT Gateway
- The NAT Gateway is placed in a public subnet with an Elastic IP
- Route tables ensure proper traffic flow between subnets and to/from the internet

## Deployment Instructions
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

4. To destroy resources when done:
   ```bash
   terraform destroy
   ```



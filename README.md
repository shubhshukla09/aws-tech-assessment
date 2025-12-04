# AWS Technical Assessment

This repository contains solutions for the AWS Technical Assessment with Terraform. The assessment includes five tasks covering various AWS services and best practices.

## Tasks

1. **Networking & Subnetting (AWS VPC Setup)**
   - VPC with public and private subnets
   - Internet Gateway and NAT Gateway configuration
   - Route tables and security groups

2. **EC2 Static Website**
   - EC2 instance with Nginx web server
   - Security group configuration
   - Static website deployment

3. **High Availability & Auto Scaling**
   - Application Load Balancer
   - Auto Scaling Group with Launch Template
   - Target Groups and Health Checks

4. **Billing & Monitoring**
   - CloudWatch Billing Alarms
   - SNS Notifications
   - Cost monitoring setup

5. **Architecture Diagram**
   - Visual representation of the infrastructure
   - Detailed architecture description

## Prerequisites

- AWS Account with appropriate permissions
- Terraform installed locally
- AWS CLI configured with credentials
- Git for version control

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/shubhshukla09/aws-tech-assessment.git
   cd aws-tech-assessment
   ```

2. Navigate to each task directory and follow the instructions in the respective README.md

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Review the execution plan:
   ```bash
   terraform plan
   ```

5. Apply the configuration:
   ```bash
   terraform apply
   ```

## Cleanup

After completing the assessment, destroy all resources to avoid unnecessary charges:

```bash
cd <task-directory>
terraform destroy
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Shubh Shukla

## Screenshots

Screenshots of each implementation are available in the respective task directories.

# Task 4: Billing & Cost Monitoring

This setup configures AWS billing alerts and monitoring to help you track and manage your AWS costs.

## ⚠️ Important Notes
- Billing alerts require manual setup in the AWS Billing Console
- The Terraform code provides the infrastructure, but you need to enable billing alerts
- Free Tier usage alerts are managed separately in the AWS Billing Console

## Prerequisites
1. AWS account with billing access
2. Billing alerts enabled in your AWS account
3. AWS CLI configured with appropriate permissions

## Manual Setup Required

### 1. Enable Billing Alerts
1. Sign in to the AWS Management Console as the root user
2. Navigate to the [Billing Dashboard](https://console.aws.amazon.com/billing/)
3. In the navigation pane, choose **Billing Preferences**
4. Under **Cost Management Preferences**, select **Receive Billing Alerts**
5. Choose **Save preferences**

### 2. Set Up Free Tier Alerts
1. Go to the [AWS Billing Console](https://console.aws.amazon.com/billing/)
2. In the navigation pane, choose **Bills**
3. Under **Alerts**, choose **Manage Alerts**
4. Configure alerts for Free Tier usage

## Terraform Configuration

### Variables
Update `terraform.tfvars` with your configuration:

```hcl
billing_threshold_amount = 100  # USD
notification_email      = "your-email@example.com"
alarm_name_prefix       = "Shubh_Shukla"
currency               = "USD"
```

### Deployment

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

4. After applying, check your email and confirm the SNS subscription

## Screenshots Required
1. **Billing Preferences** - Showing "Receive Billing Alerts" enabled
2. **CloudWatch Alarms** - Showing the billing alarm in "OK" state
3. **SNS Topics** - Showing the subscription status
4. **Free Tier Alerts** - Configuration in the Billing Console

## Cleanup
To remove all resources:
```bash
terraform destroy
```


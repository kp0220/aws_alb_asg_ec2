# AWS ALB with Auto Scaling Group Infrastructure

This project contains Terraform configurations to set up a scalable infrastructure on AWS using Application Load Balancer (ALB), Auto Scaling Group (ASG), and EC2 instances.

## Architecture

The infrastructure consists of:
- Application Load Balancer (ALB)
- Auto Scaling Group (ASG)
- Launch Template for EC2 instances
- Security Groups
- Amazon Machine Image (AMI) configuration

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform >= 1.5.7
- An AWS account with necessary permissions

## File Structure

```
.
├── alb.tf                  # Application Load Balancer configuration
├── ami.tf                  # AMI configuration for EC2 instances
├── autoscaling.tf         # Auto Scaling Group configuration
├── data.tf               # Data sources
├── launch_template.tf    # EC2 Launch Template configuration
├── main.tf              # Provider configuration
├── outputs.tf           # Output variables
├── security_groups.tf   # Security Group configurations
├── user_data.sh        # EC2 instance user data script
└── variable.tf         # Input variables
```

## Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Review the changes:
```bash
terraform plan
```

3. Apply the configuration:
```bash
terraform apply
```

4. When you're done, destroy the resources:
```bash
terraform destroy
```

## Variables

Configure the variables in a `terraform.tfvars` file or pass them via command line. Key variables include:
- `region`: AWS region to deploy the infrastructure
- (Add other variables based on your variable.tf file)

## Security

- Security groups are configured to control inbound and outbound traffic
- The infrastructure uses private subnets for EC2 instances
- Load balancer is placed in public subnets
- All security best practices should be reviewed before production use

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

Please add appropriate license information here.

## Notes

- Remember to always review the terraform plan before applying changes
- Costs will be incurred for the AWS resources created
- Ensure proper IAM permissions are in place

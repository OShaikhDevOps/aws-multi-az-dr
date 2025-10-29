# AWS Multi-AZ Disaster Recovery (Portfolio Project)

This repository contains an opinionated, modular Terraform scaffold implementing a multi-AZ disaster recovery architecture on AWS. It is intended as a portfolio/demo project showing IaC, automated failover runbooks, cross-region S3 replication, RDS Multi-AZ, ALB+ASG, monitoring, and CI for Terraform.

Summary
- Terraform modules for networking, RDS (Multi-AZ), S3 (with cross-region replication), ALB+ASG, monitoring, and DR automation.
- GitHub Actions workflow to run terraform fmt/validate/plan (with a manual apply step template).
- Backend configuration example using S3 + DynamoDB for state locking (fill in real values before use).

Quick start (local plan only)
1. Install Terraform 1.5+ and configure AWS credentials in your shell.
2. Copy `backend.tf.example` -> `backend.tf` and update the bucket/dynamodb table names.
3. Copy `envs/example.tfvars` -> `envs/dev.tfvars` and edit variables.
4. Run:

```powershell
terraform init
terraform validate
terraform plan -var-file=envs/dev.tfvars
```

Structure
- `modules/` - reusable modules (network, rds, s3, alb_asg, monitoring, dr_runbook)
- `envs/` - example environment variable files
- `.github/workflows/` - CI workflows for Terraform

Notes
- This scaffold is intentionally conservative and cost-aware (single NAT by default). Enable HA NAT and larger instance sizes for production.
- The DR automation and Lambda templates are included as examples; for a live deployment you must provide AWS credentials and adjust IAM policies.

Next steps
- Review `modules/` and provide any preferences (RDS engine/instance sizes, primary/replica regions).
- I can apply to a live AWS account if you supply credentials or run it locally and share the plan output.

License: MIT

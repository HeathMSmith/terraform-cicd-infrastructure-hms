## CI/CD Architecture

This project demonstrates a secure Terraform CI/CD pipeline.

GitHub Actions → OIDC authentication → AWS IAM Role → Terraform deployment

Key components:

- GitHub Actions pipeline
- Terraform Infrastructure as Code
- AWS OIDC authentication (no stored credentials)
- S3 backend for remote Terraform state
- DynamoDB table for state locking
- tfsec security scanning
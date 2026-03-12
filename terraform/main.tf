terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
resource "aws_s3_bucket" "example" {
  bucket = "hms-cicd-demo-bucket-123456"

  tags = {
    Name        = "terraform-cicd-demo"
    Environment = "dev"
  }
}
resource "aws_s3_bucket_public_access_block" "example_block" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}
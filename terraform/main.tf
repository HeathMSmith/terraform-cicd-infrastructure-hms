terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "hms-terraform-state-bucket-82771"
    key    = "cicd/terraform.tfstate"
    region = "us-east-1"
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
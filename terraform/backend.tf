terraform {
  backend "s3" {
    bucket         = "heath-terraform-state"
    key            = "terraform-cicd/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
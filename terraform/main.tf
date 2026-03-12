############################################
# S3 Bucket for CI/CD Demo
############################################

#tfsec:ignore:aws-s3-enable-bucket-logging
resource "aws_s3_bucket" "example" {
  bucket = "hms-cicd-demo-bucket-123456"

  tags = {
    Name        = "terraform-cicd-demo"
    Environment = "dev"
  }
}

############################################
# Block Public Access
############################################

resource "aws_s3_bucket_public_access_block" "example_block" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

############################################
# Enable Versioning
############################################

resource "aws_s3_bucket_versioning" "example_versioning" {
  bucket = aws_s3_bucket.example.id

  versioning_configuration {
    status = "Enabled"
  }
}

############################################
# KMS Key for Encryption
############################################

resource "aws_kms_key" "s3_key" {
  description             = "Customer managed key for S3 encryption"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

############################################
# Enable Bucket Encryption
############################################

resource "aws_s3_bucket_server_side_encryption_configuration" "example_encryption" {
  bucket = aws_s3_bucket.example.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

# Provider Block
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "tia-terraform-state-backend"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }
  tags = {
    Name = "S3 Remote Terraform State Store"
  }
}

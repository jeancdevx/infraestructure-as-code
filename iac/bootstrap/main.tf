terraform {
  required_version = ">= 1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "tf_state" {
  bucket = var.bucket_name
  lifecycle { prevent_destroy = true }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.tf_state.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = var.lock_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.tf_state.bucket
}

output "lock_table" {
  value = aws_dynamodb_table.tf_lock.name
}

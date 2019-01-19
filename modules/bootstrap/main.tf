# This is a Terraform module for managing the s3 bucket and dynamodb table for the terraform state store.

resource "aws_s3_bucket" "s3" {

  bucket = "${var.s3_bucket}"

  tags {
    Name        = "Terraform Remote State"
    Environment = "${var.app_env}"
    Project     = "${var.app_name}"
    Owner       =  "${var.owner}"
    ManagedBy   = "TERRAFORM"
  }

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
}

resource "aws_dynamodb_table" "dynamodb" {
  name           = "${var.dynamodb_table}"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags {
    Name        = "Terraform Lock Table"
    Environment = "${var.app_env}"
    Project     = "${var.app_name}"
    Owner       =  "${var.owner}"
    ManagedBy   = "TERRAFORM"
  }
}

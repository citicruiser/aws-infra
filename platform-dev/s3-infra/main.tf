provider "aws" {
  region              = "${var.region}"
  version             = "~> 1.8"
  allowed_account_ids = "${var.allowed_account_ids}"
  shared_credentials_file = "${var.shared_credentials_file}"
  profile                 = "${var.profile}"
}

terraform
{
  required_version = "~> 0.11.3"

  backend s3
  {
    bucket         = "platform1-terraformstate-dev-wqpt"
    key            = "s3-infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "platform1-terraformlock-dev"
    profile = "wqpt-platform-dev"
  }
}


resource "aws_s3_bucket" "s3_cloudtrail" {

  bucket = "${var.app_name}-cloudtrail-${var.app_env}-${var.company}"

  tags = {
    Owner       = "${var.owner}"
    Environment = "${var.app_env}"
    Application = "${var.app_name}"
    Terraform = "true"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket" "s3_vpc_flowlog" {

  bucket = "${var.app_name}-vpc-flowlog-${var.app_env}-${var.company}"

  tags = {
    Owner       = "${var.owner}"
    Environment = "${var.app_env}"
    Application = "${var.app_name}"
    Terraform = "true"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket" "s3_infra" {

  bucket = "${var.app_name}-infra-${var.app_env}-${var.company}"

  tags = {
    Owner       = "${var.owner}"
    Environment = "${var.app_env}"
    Application = "${var.app_name}"
    Terraform = "true"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}



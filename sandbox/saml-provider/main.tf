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
    bucket         = "research-a-terraformstate-sbx-wqpt"
    key            = "saml-provider/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "research-a-terraformlock-sbx"
    profile = "wqpt-sandbox1"
  }
}


resource "aws_iam_saml_provider" "google" {
  name                   = "Google"
  saml_metadata_document = "${file("saml-metadata.xml")}"
}
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
    key            = "iam/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "research-a-terraformlock-sbx"
    profile = "wqpt-sandbox1"
  }
}

data terraform_remote_state saml
{
  backend = "s3"
  config
  {
//    bucket = "${var.terraformstate}"  //s3 bucket name for terraform state
    bucket = "research-a-terraformstate-sbx-wqpt"
    key    = "saml-provider/terraform.tfstate"
    //key = "vpc/terraform.tfstate"
    region = "us-east-1"
   // profile = "${var.profile}"
    profile = "wqpt-sandbox1"

  }
}

module "google-developer-role" {
  source = "../../modules/iam/google-identity-role"
  name = "${var.app_name}-developer-${var.app_env}"
  policy-arns = "${var.developer-policy-arns}"
  google_identity_arn = "${data.terraform_remote_state.saml.saml-provider}"
  owner = "${var.owner}"
  app_name = "${var.app_name}"
  app_env = "${var.app_env}"
}

module "google-admin-role" {
  source = "../../modules/iam/google-identity-role"
  name = "${var.app_name}-admin-${var.app_env}"
  policy-arns = "${var.admin-policy-arns}"
  google_identity_arn = "${data.terraform_remote_state.saml.saml-provider}"
  owner = "${var.owner}"
  app_name = "${var.app_name}"
  app_env = "${var.app_env}"
}

module "google-researcher-role" {
  source = "../../modules/iam/google-identity-role"
  name = "${var.app_name}-researcher-${var.app_env}"
  policy-arns = "${var.researcher-policy-arns}"
  google_identity_arn = "${data.terraform_remote_state.saml.saml-provider}"
  owner = "${var.owner}"
  app_name = "${var.app_name}"
  app_env = "${var.app_env}"
}
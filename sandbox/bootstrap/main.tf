provider "aws" {
  region              = "${var.region}"
  version             = "~> 1.8"
  allowed_account_ids = "${var.allowed_account_ids}"
  shared_credentials_file = "${var.shared_credentials_file}"
  profile                 = "${var.profile}"
}

module "bootstrap"  {
  source   = "../../modules/bootstrap"
  app_env  = "${var.app_env}"
  app_name = "${var.app_name}"
  owner = "${var.owner}"

  s3_bucket      = "${var.app_name}-terraformstate-${var.app_env}-${var.company}"
  dynamodb_table = "${var.app_name}-terraformlock-${var.app_env}"
}

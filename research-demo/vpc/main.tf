provider "aws" {
  region              = "${var.region}"
  version             = "~> 1.8"
 // allowed_account_ids = "${var.allowed_account_ids}"
  shared_credentials_file = "${var.shared_credentials_file}"
  profile                 = "${var.profile}"
}


terraform
{
  required_version = "~> 0.11.3"

  backend s3
  {
    bucket         = "research-terraformstate-demo-wqpr"
    key            = "vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "research-terraformlock-demo"
    profile = "wqpr-research-demo"
  }
}


module "vpc" {
  source = "../../modules/vpc-wqpr"
  name = "${var.name}"
  cidr = "${var.cidr}"
  azs             = "${var.azs}"
  public_subnets  = "${var.public_subnets}"
  //web1, web2, and data1 are internal with Internet
  private_subnets = "${var.web1_subnets}"
  private2_subnets = "${var.web2_subnets}"
  private3_subnets = "${var.data1_subnets}"
  //data2 is internal without internet
  intra_subnets       = "${var.data2_subnets}"
 // intra2_subnets      = "${var.data2_subnets}"
  assign_generated_ipv6_cidr_block = "${var.assign_generated_ipv6_cidr_block}"

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Owner       = "${var.owner}"
    Environment = "${var.app_env}"
    Application = "${var.app_name}"
    Terraform = "true"
  }

}

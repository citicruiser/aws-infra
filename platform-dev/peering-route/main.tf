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
    key            = "peering-route/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "platform1-terraformlock-dev"
    profile = "wqpt-platform-dev"

  }
}


#########################################################################
#                         Remote States
#########################################################################

data terraform_remote_state vpc
{
  backend = "s3"
  config
  {
    bucket = "${var.terraformstate}"  //s3 bucket name for terraform state
    key    = "vpc/terraform.tfstate"
    region = "us-east-1"
    profile = "${var.profile}"
  }
}

resource "aws_route" "peering-private-subnet" {
  route_table_id            = "${data.terraform_remote_state.vpc.private_route_table_ids[0]}"  //Route table for subnet web1, web2 and data1
  destination_cidr_block    = "${var.destination_cidr_block}"   //CIDR Corp VPC
  vpc_peering_connection_id = "${var.vpc_peering_connection_id}"
  //depends_on                = ["aws_route_table.testing"]
}

resource "aws_route" "peering-intra-subnet" {
  route_table_id            = "${data.terraform_remote_state.vpc.intra_route_table_ids[0]}"  //Route table for subnet data2
  destination_cidr_block    = "${var.destination_cidr_block}"   //CIDR Corp VPC
  vpc_peering_connection_id = "${var.vpc_peering_connection_id}"
  //depends_on                = ["aws_route_table.testing"]
}

resource "aws_route" "peering-public-subnet" {
  route_table_id            = "${data.terraform_remote_state.vpc.public_route_table_ids[0]}"  //Route table for subnet data2
  destination_cidr_block    = "${var.destination_cidr_block}"   //CIDR Corp VPC
  vpc_peering_connection_id = "${var.vpc_peering_connection_id}"
  //depends_on                = ["aws_route_table.testing"]
}
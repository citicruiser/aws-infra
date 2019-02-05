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
    bucket         = "data1-terraformstate-prod-wqpt"
    key            = "peering-route/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "data1-terraformlock-prod"
    profile = "wqpt-data1-prod"

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
  count = "${length(var.destination_cidr_block)}"
  route_table_id            = "${data.terraform_remote_state.vpc.private_route_table_ids[0]}"  //Route table for subnet web1, web2 and data1
  destination_cidr_block    = "${element(var.destination_cidr_block, count.index)}"   //CIDR Corp VPC
  vpc_peering_connection_id = "${element(concat(var.vpc_peering_connection_id, list("")), count.index)}"
  //depends_on                = ["aws_route_table.testing"]
}


resource "aws_route" "peering-public-subnet" {
  count = "${length(var.destination_cidr_block)}"
  route_table_id            = "${data.terraform_remote_state.vpc.public_route_table_ids[0]}"  //Route table for public subnets
  destination_cidr_block    = "${element(var.destination_cidr_block, count.index)}"   //CIDR Corp VPC
  vpc_peering_connection_id = "${element(concat(var.vpc_peering_connection_id, list("")), count.index)}"
  //depends_on                = ["aws_route_table.testing"]
}

resource "aws_route" "peering-intra-subnet" {
  count = "${length(var.destination_cidr_block)}"
  route_table_id            = "${data.terraform_remote_state.vpc.intra_route_table_ids[0]}"  //Route table for subnet data2
  destination_cidr_block    = "${element(var.destination_cidr_block, count.index)}"   //CIDR Corp VPC
  vpc_peering_connection_id = "${element(concat(var.vpc_peering_connection_id, list("")), count.index)}"
  //depends_on                = ["aws_route_table.testing"]
}


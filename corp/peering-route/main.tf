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
    bucket         = "corp-terraformstate-corp-wqpt"
    key            = "peering-route/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "corp-terraformlock-corp"
    profile = "wqpt-corp"

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

//May need to enable for web1 and web2 later
/*
resource "aws_route" "peering-private-subnet" {
  count = "${length(var.destination_cidr_block)}"
  route_table_id            = "${data.terraform_remote_state.vpc.private_route_table_ids[0]}"  //Route table for subnet web1, web2 and data1
  destination_cidr_block    = "${element(var.destination_cidr_block, count.index)}"   //CIDR Corp VPC
  vpc_peering_connection_id = "${element(concat(var.vpc_peering_connection_id, list("")), count.index)}"
  //depends_on                = ["aws_route_table.testing"]
}
*/

resource "aws_route" "peering-public-subnet" {
  count = "${length(var.destination_cidr_block)}"
  route_table_id            = "${data.terraform_remote_state.vpc.public_route_table_ids[0]}"  //Route table for public subnets
  destination_cidr_block    = "${element(var.destination_cidr_block, count.index)}"   //CIDR Corp VPC
  vpc_peering_connection_id = "${element(concat(var.vpc_peering_connection_id, list("")), count.index)}"
  //depends_on                = ["aws_route_table.testing"]
}

#application tags
variable "owner" {}
variable "company" {}
variable "app_name" {}
variable "app_env" {}


#aws account and credential
variable "shared_credentials_file" {}
variable "profile" {}
variable "allowed_account_ids" {default = []}
variable "region" {}
variable "terraformstate" {}

#Route Table
variable "vpc_peering_connection_id" {}
variable "destination_cidr_block" {}







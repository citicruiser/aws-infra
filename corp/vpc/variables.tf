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

#VPC
variable "name" {}
variable "cidr" {}
variable "azs" {default = []}

#Subnets
variable "public_subnets" {default = []}
variable "web1_subnets" {default = []}
variable "web2_subnets" {default = []}
variable "data1_subnets" {default = []}
variable "data2_subnets" {default = []}

#VPC Settings
variable "assign_generated_ipv6_cidr_block" {}
//variable "enable_nat_gateway" {}
//variable "single_nat_gateway" {}
//variable "enable_dns_hostnames" {}
//variable "enable_dns_support" {}






variable "app_name" { description = "The name of the application" }
variable "app_env" { description = "The name of the env" }
variable "region" { description = "The AWS region to use" }
variable "owner" {}
variable "company" {}

variable "shared_credentials_file" {}
variable "profile" {}
variable "allowed_account_ids" {
  description = "The list of allowed account ids"
  type        = "list"
}

variable "google_identity_arn" {}
variable "developer-policy-arns" {default = []}
variable "admin-policy-arns" {default = []}
variable "researcher-policy-arns" {default = []}
variable "terraformstate" {} //s3 bucket for terraform state

/*
variable "tags" {
  default = {},
  type = "map"
}

*/



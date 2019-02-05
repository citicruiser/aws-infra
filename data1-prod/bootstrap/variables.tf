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


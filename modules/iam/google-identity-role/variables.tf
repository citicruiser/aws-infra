variable "app_name" { description = "The name of the application" }
variable "app_env" { description = "The name of the env" }
//variable "region" { description = "The AWS region to use" }
variable "owner" {}


variable "google_identity_arn" {}
variable "policy-arns" {default =[]}
//variable  "google-role" {}
variable "tags"    {type = "map", default = {}}
variable "name" {}



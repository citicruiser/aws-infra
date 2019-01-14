variable "app_env" {
  description = "Name of the environment. Example: prod"
  type        = "string"
}

variable "s3_bucket" {
  description = "S3 bucket for terraform state."
  type        = "string"
}

variable "dynamodb_table" {
  description = "DynamoDB table name for terraform lock."
  type        = "string"
}

variable "app_name" {
  description = "Name of application"
  type = "string"
}

//variable "APP_NAME" {}
variable "owner" {}
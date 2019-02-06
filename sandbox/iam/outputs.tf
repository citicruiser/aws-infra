output google-developer-role
{
  description = "The ARN of IAM Role"
  value       = "${module.google-developer-role.arn}"
}

output google-admin-role
{
  description = "The ARN of IAM Role"
  value       = "${module.google-admin-role.arn}"
}

output google-researcher-role
{
  description = "The ARN of IAM Role"
  value       = "${module.google-researcher-role.arn}"
}
output arn
{
  description = "The ARN of IAM Role"
  value       = "${aws_iam_role.google-role.arn}"
}

output name
{
  description = "The name of IAM Role"
  value = "${aws_iam_role.google-role.name}"
}

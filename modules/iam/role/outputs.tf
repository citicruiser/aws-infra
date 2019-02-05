output arn
{
  description = "The ARN of IAM Role"
  value       = "${aws_iam_role.default.arn}"
}

output unique_id
{
  description = "The ARN Unique ID of IAM Role"
  value       = "${aws_iam_role.default.arn}"
}

output name
{
  description = "The name of IAM Role"
  value = "${aws_iam_role.default.name}"
}

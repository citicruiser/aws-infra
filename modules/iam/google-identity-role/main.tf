resource "aws_iam_role" "google-role" {
  name = "${var.name}"
  description = "Role for Google Identity Provider"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "${var.google_identity_arn}"
      },
      "Action": "sts:AssumeRoleWithSAML",
      "Condition": {
        "StringEquals": {
          "SAML:aud": "https://signin.aws.amazon.com/saml"
        }
      }
    }
  ]
}
EOF

  tags = {
    Owner       = "${var.owner}"
    Environment = "${var.app_env}"
    Application = "${var.app_name}"
    Terraform = "true"
  }
}

resource aws_iam_role_policy_attachment google-role
{
  count = "${length(var.policy-arns)}"
  policy_arn = "${var.policy-arns[count.index]}"
  role = "${aws_iam_role.google-role.name}"
}
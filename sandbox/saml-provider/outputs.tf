# VPC
output "saml-provider" {
  description = "The ID of the saml-provider"
  value       = "${aws_iam_saml_provider.google.id}"
}
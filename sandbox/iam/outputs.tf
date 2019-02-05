output role-names
{
  value = {
    beanstalk-runtime = "${module.beanstalk-runtime-role.name}"
    ec2-runtime       = "${module.ec2-runtime-role.name}"
    lambda-default    = "${aws_iam_role.lambda-default-role.name}"
    lambda-general    = "${aws_iam_role.lambda-general-role.name}"

    beanstalk-payment-gateway = "${module.payment-gateway-beanstalk.name}"
    ec2-payment-gateway = "${module.payment-gateway-ec2.name}"
  }
}

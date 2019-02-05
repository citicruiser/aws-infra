data aws_iam_policy_document default
{
  statement
  {
    actions = ["sts:AssumeRole"]
    principals
    {
      type        = "Service"
      identifiers = ["${var.service}.amazonaws.com"]
    }
  }
}

resource aws_iam_role default
{
  assume_role_policy = "${var.trust == "" ? data.aws_iam_policy_document.default.json : var.trust}"
  name = "${var.name}"
  # tags = "${var.tags}"
}

resource aws_iam_role_policy_attachment default-aws
{
  count = "${length(var.policies-aws)}"
  policy_arn = "arn:aws:iam::aws:policy/${var.policies-aws[count.index]}"
  role = "${aws_iam_role.default.name}"
}

resource aws_iam_role_policy_attachment default-arn
{
  count = "${length(var.policy-arns)}"
  policy_arn = "${var.policy-arns[count.index]}"
  role = "${aws_iam_role.default.name}"
}

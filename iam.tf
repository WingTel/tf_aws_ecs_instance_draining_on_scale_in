resource "aws_iam_role" "sns" {
  name               = "${var.service_name}-notifies-sns"
  assume_role_policy = data.aws_iam_policy_document.autoscaling_role_policy.json
}

resource "aws_iam_role_policy" "asg_notification_sns" {
  name   = "${aws_iam_role.sns.name}-asg-notification-policy"
  role   = aws_iam_role.sns.id
  policy = data.aws_iam_policy_document.auto_scaling_notification_access.json
}

resource "aws_iam_role" "lambda" {
  assume_role_policy = data.aws_iam_policy_document.lambda_role_policy.json
}

resource "aws_iam_role_policy" "lambda" {
  name   = "${aws_iam_role.lambda.name}-policy"
  role   = aws_iam_role.lambda.id
  policy = data.aws_iam_policy_document.lambda.json
}

resource "aws_iam_role_policy" "asg_notification_lambda" {
  name   = "${aws_iam_role.lambda.name}-asg-notification-policy"
  role   = aws_iam_role.lambda.id
  policy = data.aws_iam_policy_document.auto_scaling_notification_access.json
}

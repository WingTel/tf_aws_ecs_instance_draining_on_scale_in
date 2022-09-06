resource "aws_autoscaling_lifecycle_hook" "terminate" {
  count                   = var.lambda_enabled ? 1 : 0
  name                    = "${var.autoscaling_group_name}-terminate-hook"
  autoscaling_group_name  = var.autoscaling_group_name
  default_result          = var.hook_default_result
  heartbeat_timeout       = var.hook_heartbeat_timeout
  lifecycle_transition    = "autoscaling:EC2_INSTANCE_TERMINATING"
  notification_target_arn = aws_sns_topic.asg_sns.arn
  role_arn                = aws_iam_role.sns.arn
}

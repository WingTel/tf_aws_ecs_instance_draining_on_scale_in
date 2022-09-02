resource "aws_sns_topic" "asg_sns" {
  name = "${var.service_name}-sns-topic"
}

resource "aws_sns_topic_subscription" "asg_sns" {
  topic_arn = aws_sns_topic.asg_sns.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.lambda.arn
}

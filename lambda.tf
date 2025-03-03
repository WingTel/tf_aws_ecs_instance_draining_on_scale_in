resource "aws_lambda_function" "lambda" {
  runtime       = "python3.10"
  filename      = "${path.module}/files/index.zip"
  function_name = var.service_name
  role          = aws_iam_role.lambda.arn
  handler       = "index.handler"
  timeout       = var.function_sleep_time * 20

  source_code_hash = data.archive_file.index.output_base64sha256

  environment {
    variables = {
      LOGLEVEL = "INFO"
    }
  }
}

resource "aws_lambda_permission" "sns" {
  statement_id  = "AllowExecutionFromSNS"
  function_name = aws_lambda_function.lambda.arn
  action        = "lambda:InvokeFunction"
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.asg_sns.arn
}

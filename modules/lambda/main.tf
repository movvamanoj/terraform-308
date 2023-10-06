resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
resource "aws_lambda_permission" "sns_invoke_lambda" {
  statement_id  = "AllowSNSInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.file_validation_lambda.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.file_upload_failure_topic.arn
}
resource "aws_sns_topic_subscription" "lambda_subscription" {
  topic_arn = aws_sns_topic.file_upload_failure_topic.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.file_validation_lambda.arn
}

# Configure S3 bucket permission to invoke Lambda function
resource "aws_lambda_permission" "s3_invoke_lambda_s3" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.file_validation_lambda.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${var.bucket_name}"
}

data "archive_file" "lambda_functions_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda_functions.py"
  output_path = "${path.module}/lambda_functions.zip"
}


resource "null_resource" "create_lambda_functions_zip" {
  triggers = {
    archive_file_sha256 = data.archive_file.lambda_functions_zip.output_sha256
  }

  provisioner "local-exec" {
    command = "zip ${path.module}/lambda_functions.zip ${path.module}/lambda_functions.py"
   #-j working_dir = path.module
  }
}
resource "aws_sns_topic" "file_upload_failure_topic" {
  name = "file-upload-failure-topic"
}

data "aws_sns_topic" "file_upload_failure_topic" {
  name = aws_sns_topic.file_upload_failure_topic.name
}
# Create Lambda function for file validation
resource "aws_lambda_function" "file_validation_lambda" {
  function_name    = "file_validation_lambda"
  role             = aws_iam_role.lambda_execution_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.8"
  timeout          = 300

  filename         = "${path.module}/lambda_functions.zip"

  environment {
    variables = {
      SNS_TOPIC_ARN     = aws_sns_topic.file_upload_failure_topic.arn
      SLACK_WEBHOOK_URL = var.slack_endpoint
      EMAIL_ENDPOINT    = var.email_endpoint
    }
  }
}


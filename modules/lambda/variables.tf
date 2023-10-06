
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "data-lake-hub-bucket"
}

variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "lambda_function"
}

variable "function_code" {
  description = "Path to the Lambda function code"
  type        = string
  default     = "lambda_function_code"
}

variable "lambda_role_arn" {
  description = "ARN of the IAM role for the Lambda function"
  type        = string
  default = "value"
}
variable "email_endpoint" {
  description = "Email endpoint for incident alerting"
  type        = string
  default     = "movvamanoj@gmail.com"
}
variable "slack_endpoint" {
  description = "Slack endpoint for incident alerting"
  type        = string
  default     = "https://hooks.slack.com/services/YOUR_SLACK_WEBHOOK_URL"
}
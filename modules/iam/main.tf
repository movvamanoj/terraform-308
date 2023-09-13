#---------------------------------------------------------------------
# AWS IAM Policy and Role Configuration for S3 Access
#
# Author: movvmanoj
# Created: September 12, 2023
# Copyright (c) 2023 S. All rights reserved.
#---------------------------------------------------------------------
# This section defines resources for an IAM policy and role for S3 access.

# Define an IAM policy for S3 access.
resource "aws_iam_policy" "s3_access_policy" {
  policy = file("${path.module}/json/s3_access_policy.json")
}

# Define an IAM role for EC2 instances with S3 access.
resource "aws_iam_role" "ec2_role" {
  name = "ec2_s3_access_role"

  # Define the trust policy allowing EC2 instances to assume this role.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach the S3 access policy to the IAM role.
resource "aws_iam_role_policy_attachment" "s3_access_attachment" {
  policy_arn = aws_iam_policy.s3_access_policy.arn
  role       = aws_iam_role.ec2_role.name
}

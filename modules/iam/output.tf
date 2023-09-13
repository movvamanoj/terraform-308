#---------------------------------------------------------------------
# Output Configuration for IAM Resources
#
# Author: movvmanoj
# Created: September 12, 2023
# Copyright (c) 2023 S. All rights reserved.
#---------------------------------------------------------------------
# This section defines outputs for IAM resources.

# Export the ARN of the S3 access policy.
output "s3_access_policy_arn" {
  value = aws_iam_policy.s3_access_policy.arn
}

# Export the name of the EC2 role.
output "ec2_role_name" {
  value = aws_iam_role.ec2_role.name
}

# Export the role name associated with the S3 access policy attachment.
output "s3_access_attachment_role_name" {
  value = aws_iam_role_policy_attachment.s3_access_attachment.role
}

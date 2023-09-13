#---------------------------------------------------------------------
# Output Configuration for ALB DNS Name
#
# Author: movvmanoj
# Created: September 11, 2023
# Copyright (c) 2023 S. All rights reserved.
#---------------------------------------------------------------------
# This output exports the DNS name of the AWS ALB.
# Uncomment the lines below to include this output in your Terraform plan.

# output "alb_dns_name" {
#   value = aws_lb.my_alb.dns_name
# }

output "alb_dns_name" {
  # Get a list of DNS names for all ALBs created.
  value = [for alb in aws_lb.my_alb : alb.dns_name]
}
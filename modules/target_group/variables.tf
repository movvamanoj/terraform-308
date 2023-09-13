#---------------------------------------------------------------------
# Terraform Variables Configuration for Target Groups
#
# Author: movvmanoj
# Created: September 10, 2023
# Copyright (c) 2023 S. All rights
#---------------------------------------------------------------------
# This file defines variables used in the Terraform Target Group configuration.

# The VPC ID where the target group will be created.
variable "vpc_id" {
  description = "The VPC ID where the target group will be created."
  type        = string
}
# List of EC2 instance IDs to attach to the target group.
variable "aws_instance_ids" {
  description = "List of EC2 instance IDs to attach to the target group."
  type        = list(string)
}
# List of target group names.
variable "target_group_names" {
  type    = list(string)
 # default = []  # Leave this empty since the names are generated automatically
}
# Number of target groups to create.
variable "target_group_count" {
  type    = number
 # default = 3  # Set the default count as needed
}

# Number of instances to attach to the target groups.
variable "instance_count" {
  type = number
  description = "we are providing instance count "  
}

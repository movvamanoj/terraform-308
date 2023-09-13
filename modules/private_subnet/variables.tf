#---------------------------------------------------------------------
# Terraform Private Subnet Variables Configuration
#
# Author: movvmanoj
# Created: September 09, 2023
# Copyright (c) 2023 S. All rights reserved.
#---------------------------------------------------------------------
# This file defines variables used in the Terraform configuration.

# CIDR block for the VPC.
variable "vpc_cidr" {
  description = "ID of the VPC"
  type        = string
}
# ID of the VPC.
variable "vpc_id" {
  description = "ID of the VPC"
}

# Number of private subnet CIDR blocks.
variable "private_subnet_cidrs_count" {
  description = "List of CIDR blocks for subnets"
  type        = number
}



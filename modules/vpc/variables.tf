#---------------------------------------------------------------------
# Terraform Variable Configuration for VPC CIDR Block
#
# Author: movvmanoj
# Created: September 08, 2023
# Copyright (c) 2023 S. All rights
#---------------------------------------------------------------------
# This file defines a variable for the CIDR block of the VPC.

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

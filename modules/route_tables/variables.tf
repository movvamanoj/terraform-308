#---------------------------------------------------------------------
# Terraform Variables Configuration for Route Table
# Author: movvmanoj
# Created: September 10, 2023
# Copyright (c) 2023 S. All rights reserved.
#---------------------------------------------------------------------
# This file defines variables used in the Terraform networking configuration.

# ID of the VPC.
variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

# ID of the Internet Gateway.
variable "gateway_id" {
  description = "ID of the Internet Gateway"
  type        = string
}

# List of NAT instance IDs.
variable "nat_instance_id" {
  type        = list(string)
  description = "List of NAT instance IDs"
}

# Number of public subnet CIDR blocks.
variable "public_subnet_cidrs_count" {
  description = "Number of public subnet CIDR blocks"
  type        = number
}

# Number of private subnet CIDR blocks.
variable "private_subnet_cidrs_count" {
  type        = number
  description = "Number of private subnet CIDR blocks"
}

# List of CIDR blocks for public subnets.
variable "public_subnet" {
  type    = list(string)
}

# List of CIDR blocks for private subnets.
variable "private_subnet" {
  type    = list(string)
}

# Number of NAT instances to create.
variable "nat_instance_count" {
  type        = number
  description = "Number of NAT instances to create"
}

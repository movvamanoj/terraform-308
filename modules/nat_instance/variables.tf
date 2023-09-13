#---------------------------------------------------------------------
# Terraform Variables Configuration
#
# Author: movvmanoj
# Created: September 10, 2023
# Copyright (c) 2023 S. All rights reserved.
#---------------------------------------------------------------------
# This file defines variables used in the Terraform configuration.

# Name of the PEM Key pair to be associated with instances.
variable "key_name" {
  description = "Name of the PEM Key pair."
  type        = string
}

# List of public subnets where NAT instances will be launched.
variable "public_subnet" {
  type = list(string)
}

# Type of instance to be launched for NAT instances.
variable "instance_type" {
  type        = string
  description = "Instance type, e.g., t2.micro."
}

# AMI ID for the NAT instances.
variable "nat_ami" {
  type        = string
  description = "Instance AMI ID."
}

# List of security groups associated with the NAT instances.
variable "security_groups" {
  type = list(string)
}

# ID of the VPC where NAT instances will be launched.
variable "vpc_id" {
    type = string
}

# Number of NAT instances to be created.
variable "nat_instance_count" {
  type        = number
  description = "Number of NAT instances to be created."
}

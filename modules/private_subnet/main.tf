#---------------------------------------------------------------------
# AWS Private Subnet Configuration
#
# Author: movvmanoj
# Created: September 09, 2023
# Copyright (c) 2023 S. All rights
#---------------------------------------------------------------------
# This section defines resources for AWS Subnets.

# Retrieve availability zones for the region.
data "aws_availability_zones" "available"{}

# Define private subnets based on the specified count.
resource "aws_subnet" "private" {
  count            = var.private_subnet_cidrs_count > 0 ? var.private_subnet_cidrs_count : 0
  # count             = var.private_subnet_cidrs_count
  vpc_id            = var.vpc_id
  cidr_block        =  "10.0.2${count.index}.0/24"
  # availability_zone = element(data.aws_availability_zones.available.names, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]

  tags = {
    Name = "private-Subnet-308-${count.index}"
  }
}



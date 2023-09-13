#---------------------------------------------------------------------
# AWS Public Subnet Configuration
#
# Author: movvmanoj
# Created: September 09, 2023
# Copyright (c) 2023 S. All rights
#---------------------------------------------------------------------
# This section defines resources for AWS Public Subnets.

# Retrieve availability zones for the region.
data "aws_availability_zones" "available" {}

# Define public subnets based on the specified count.
resource "aws_subnet" "public" {
  count            = var.public_subnet_cidrs_count > 0 ? var.public_subnet_cidrs_count : 0
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.1${count.index}.0/24"
  # availability_zone = data.aws_availability_zones.available.names[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]

  map_public_ip_on_launch = true
  tags = {
    Name = "Public-Subnet-308-${count.index}"
  }
}



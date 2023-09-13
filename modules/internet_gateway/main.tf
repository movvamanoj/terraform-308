#---------------------------------------------------------------------
# AWS Internet Gateway Configuration
#
# Author: movvmanoj
# Created: September 12, 2023
# Copyright (c) 2023 S. All rights reserved.
#---------------------------------------------------------------------
# This section defines a resource for an AWS Internet Gateway.

# Define an AWS Internet Gateway associated with the specified VPC.
resource "aws_internet_gateway" "my_igw" {
  vpc_id = var.vpc_id

  # Define tags for the Internet Gateway.
  tags = {
    Name = "MyIGW-308"
  }
}

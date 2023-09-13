#---------------------------------------------------------------------
# AWS VPC Configuration
#
# Author: movvmanoj
# Created: September 08, 2023
# Copyright (c) 2023 S. All rights
#---------------------------------------------------------------------

# This section defines an AWS VPC.
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "MyVPC-308"  
  }
}
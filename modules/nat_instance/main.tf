#---------------------------------------------------------------------
# AWS NAT Instance Configuration
#
# Author: movvmanoj
# Created: September 10, 2023
# Copyright (c) 2023 S. All rights reserved.
#---------------------------------------------------------------------
# This section defines resources for an AWS NAT instance.

# Define an AWS NAT instance with specified configurations.
resource "aws_instance" "nat_instance" {
   # Determine if the NAT should be created based on the instance count.
  count         = var.nat_instance_count > 0 ? var.nat_instance_count : 0
  # AMI, instance type, subnet, key name, and security groups.
  ami           = var.nat_ami  
  instance_type = var.instance_type               
  subnet_id     = var.public_subnet[0]
  key_name      = var.key_name 
  security_groups = var.security_groups
  # Define tags for the NAT instance.
  tags = {
    Name = "NAT_EC2Instance-308-${count.index + 1}"
  }
}
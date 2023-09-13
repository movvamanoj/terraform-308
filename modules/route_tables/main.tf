#---------------------------------------------------------------------
# AWS Route Table Configuration
#
# Author: movvmanoj
# Created: September 10, 2023
# Copyright (c) 2023 S. All rights
#---------------------------------------------------------------------
# This section defines resources for AWS Route Tables for public and private subnets.

######################PUBLIC##############################################
# Define a route table for public subnets.
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  tags = {
    Name = "Public-Route-Table-308"
  }
}
# Define a default route for public subnets to the internet gateway.
resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.gateway_id
    
  }
# Associate the public route table with public subnets.
  resource "aws_route_table_association" "public_subnets" {
    count            = var.public_subnet_cidrs_count > 0 ? var.public_subnet_cidrs_count : 0
    subnet_id = var.public_subnet[0] // static reference
    route_table_id = aws_route_table.public.id
  }


######################PRIVATE##############################################
# Define a route table for private subnets.
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  tags = {
    Name = "Private-Route-Table-308"
  }
}
# Define a default route for private subnets to the NAT gateway.
resource "aws_route" "nat_route" {
  count                 = length(var.nat_instance_id) > 0 ? 1 : 0
  route_table_id         = aws_route_table.private.id  
  destination_cidr_block = "0.0.0.0/0"  
  network_interface_id = var.nat_instance_id[0]
}

# Associate the private route table with private subnets.
  resource "aws_route_table_association" "private_subnets" {
    count            = var.private_subnet_cidrs_count > 0 ? var.private_subnet_cidrs_count : 0
    subnet_id = var.private_subnet[0] #static reference
    route_table_id = aws_route_table.private.id
  }

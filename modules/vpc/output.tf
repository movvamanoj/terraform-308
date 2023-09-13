#---------------------------------------------------------------------
# Output Configuration for VPC ID
#
# Author: movvmanoj
# Created: September 08, 2023
# Copyright (c) 2023 S. All rights
#---------------------------------------------------------------------
# This section defines an output for the VPC ID.

output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.my_vpc.id
}

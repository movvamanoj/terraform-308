#---------------------------------------------------------------------
# Output Configuration for Private Subnet IDs
#
# Author: movvmanoj
# Created: September 13, 2023
# Copyright (c) 2023 S. All rights reserved.
#---------------------------------------------------------------------
# This output exports the IDs of the created private subnets.
output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.private[*].id
}





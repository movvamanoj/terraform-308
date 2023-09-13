#---------------------------------------------------------------------
# Output Configuration for Internet Gateway ID
#
# Author: movvmanoj
# Created: September 12, 2023
# Copyright (c) 2023 S. All rights reserved.
#---------------------------------------------------------------------
# This output exports the ID of the created Internet Gateway.

output "igw_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.my_igw.id
}

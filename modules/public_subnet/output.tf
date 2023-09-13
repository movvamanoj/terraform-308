#---------------------------------------------------------------------
# Output Configuration for Public Subnet IDs and Availability Zones
#
# Author: movvmanoj
# Created: September 09, 2023
# Copyright (c) 2023 S. All rights reserved.
#---------------------------------------------------------------------
# This section defines outputs for Public Subnet IDs and Availability Zones.

# Export the IDs of the created public subnets.
output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}
# Export the names of the availability zones.
output "subnet_availability_zones" {
  value = data.aws_availability_zones.available.names
}

#---------------------------------------------------------------------
# Output Configuration for Route Tables
#
# Author: movvmanoj
# Created: September 10, 2023
# Copyright (c) 2023 S. All rights reserved.
#---------------------------------------------------------------------
# This section defines outputs for Route Table IDs and associations.

# Export the ID of the public route table.
output "public_route_table_id" {
  description = "ID of the public route table"
  value       = aws_route_table.public.id
}

# Export the IDs of the associations for public subnets.
output "public_route_table_association_id" {
  value = aws_route_table_association.public_subnets[*].id
}

# Export the ID of the private route table.
output "private_route_table_id" {
  description = "ID of the private route table"
  value       = aws_route_table.private.id
}

# Export the IDs of the associations for private subnets.
output "private_route_table_association_id" {
  value = aws_route_table_association.private_subnets[*].id
}

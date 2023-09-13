#---------------------------------------------------------------------
# Output Configuration for NAT Instance IDs
#
# Author: movvmanoj
# Created: September 10, 2023
# Copyright (c) 2023 S. All rights reserved.
#---------------------------------------------------------------------
# This output exports the IDs of the created NAT instances.

# output "nat_instance_ids" {
#     value = [ for instance in aws_instance.nat_instance : instance.id ]
# }
output "nat_instance_ids" {
  value = aws_instance.nat_instance[*].primary_network_interface_id
}

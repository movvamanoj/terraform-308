#---------------------------------------------------------------------
# Output Configuration for EC2 Instance IDs
#
# Author: movvmanoj
# Created: September 13, 2023
# Copyright (c) 2023 S. All rights reserved.
#---------------------------------------------------------------------
# This output exports the IDs of the created EC2 instances.

# output "ec2_instance_ids" {
#   value = aws_instance.ec2_instance[*].id 
#}

# Output EC2 Instance IDs
# This output block extracts the instance IDs of the EC2 instances created by the ec2_instance module
# and returns them as a list of strings, which can be used by other modules.

output "ec2_instance_ids" {
  value = [for instance in aws_instance.ec2_instance : instance.id]
}

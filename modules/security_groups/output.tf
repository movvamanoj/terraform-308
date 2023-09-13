#---------------------------------------------------------------------
# Output Configuration for Security Group ID
#
# Author: movvmanoj
# Created: September 09, 2023
# Copyright (c) 2023 S. All rights
#---------------------------------------------------------------------
# This section defines an output for the Security Group ID.

output "security_group_id" {
  value = aws_security_group.allow_all.id
}

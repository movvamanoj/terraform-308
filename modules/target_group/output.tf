#---------------------------------------------------------------------
# Output Configuration for Target Group ARNs
#
# Author: movvmanoj
# Created: September 10, 2023
# Copyright (c) 2023 S. All rights
#---------------------------------------------------------------------
# This section defines an output for the Target Group ARNs.

output "target_group_arns" {
  value = [for tg in aws_lb_target_group.my_target_group : tg.arn]
}

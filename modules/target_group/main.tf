#---------------------------------------------------------------------
# AWS Load Balancer Target Group Configuration
#
# Author: movvmanoj
# Created: September 10, 2023
# Copyright (c) 2023 S. All rights
#---------------------------------------------------------------------
# This section defines a target group for an AWS Load Balancer.

# Define AWS Load Balancer Target Group
resource "aws_lb_target_group" "my_target_group" {
  count = var.target_group_count
  name     = "target-group-308-${count.index + 1}"  # Automatic name increment
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    port                = "traffic-port"
    interval            = 30
    healthy_threshold   = 3
    unhealthy_threshold = 2
  }
}
#Create AWS Load Balancer Target Group Attachments (All Instances to All Target Groups)
resource "aws_lb_target_group_attachment" "instance" {
  count = var.instance_count * var.target_group_count
  target_group_arn = element(aws_lb_target_group.my_target_group.*.arn, count.index % var.target_group_count)
  target_id        = var.aws_instance_ids[count.index % var.instance_count]
}
# Create AWS Load Balancer Target Group Attachments (All Instances to Both Target Groups)
# resource "aws_lb_target_group_attachment" "instance" {
#   count            = length(var.aws_instance_ids)
#   target_group_arn = aws_lb_target_group.my_target_group[count.index].arn
#   target_id        = var.aws_instance_ids[count.index]
# }
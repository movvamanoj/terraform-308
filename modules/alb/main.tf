resource "aws_lb" "my_alb" {
  count = var.alb_count
  name               = "my-alb-${count.index + 1}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  enable_deletion_protection = false # Change as needed
  enable_http2       = true
  # subnets = slice(var.public_subnet, 0, var.az_count)
#   subnets            = slice(var.public_subnet, count.index * var.public_subnet_cidrs_count, (count.index + 1) * var.public_subnet_cidrs_count)
 # Use a dynamic list comprehension to create subnets
  subnets = [ 
    for az_index in range(var.az_count) : var.public_subnet[az_index % length(var.public_subnet)]
  ]
}

resource "aws_lb_target_group_attachment" "alb_target_attachment" {
  count            = length(var.target_group_arns)
  target_group_arn = element(var.target_group_arns, count.index)
#   target_id        = var.aws_instance_ids[count.index]
 target_id        = var.aws_instance_ids[count.index % var.instance_count]

}
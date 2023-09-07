output "target_group_arns" {
  value = [for tg in aws_lb_target_group.my_target_group : tg.arn]
}
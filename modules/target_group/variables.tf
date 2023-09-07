variable "vpc_id" {
  description = "The VPC ID where the target group will be created."
  type        = string
}
variable "aws_instance_ids" {
  description = "List of EC2 instance IDs to attach to the target group."
  type        = list(string)
}

variable "target_group_names" {
  type    = list(string)
 # default = []  # Leave this empty since the names are generated automatically
}

variable "target_group_count" {
  type    = number
 # default = 3  # Set the default count as needed
}

variable "instance_count" {
  type = number
  description = "we are providing instance count "
  
}

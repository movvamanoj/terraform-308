variable "vpc_id" {
  description = "The VPC ID where the target group will be created."
  type        = string
}
variable "aws_instance_ids" {
  description = "List of EC2 instance IDs to attach to the target group."
  type        = list(string)
}

variable "target_group_arns" {
  type    = list(string)
  default = [] # Provide the list of target group ARNs here
}
variable "security_groups" {
  type        = list(string)
}

variable "target_group_count" {
  type    = number
}

variable "instance_count" {
  type = number
  description = "we are providing instance count " 
}
variable "alb_count" {
  type    = number
}

variable "subnet_availability_zones" {
  type    = list(string)
  default = []  # Provide the list of availability zones here
}
variable "public_subnet_cidrs_count" {
  description = "List of CIDR blocks for subnets"
  type        = number
}
variable "public_subnet" {
  type = list(string)
  default = []  # Provide the default value as needed
}

variable "az_count" {
  description = "Number of Availability Zones in the region"
  type = number
}
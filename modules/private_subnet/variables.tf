variable "vpc_cidr" {
  description = "ID of the VPC"
  type        = string
}
variable "vpc_id" {
  description = "ID of the VPC"
}

variable "private_subnet_cidrs_count" {
  description = "List of CIDR blocks for subnets"
  type        = number
}



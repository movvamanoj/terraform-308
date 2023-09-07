variable "vpc_cidr" {
  description = "ID of the VPC"
  type        = string
}

variable "vpc_id" {
  type = string
  description = "ID of the VPC"
}

variable "public_subnet_cidrs_count" {
  description = "List of CIDR blocks for subnets"
  type        = number
}

# variable "public_cidr_block" {
#   type = string
# }

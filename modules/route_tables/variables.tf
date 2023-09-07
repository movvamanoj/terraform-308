variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}
variable "gateway_id" {
  description = "ID of the VPC"
}
variable "public_subnet_cidrs_count" {
  description = "List of CIDR blocks for subnets"
  type        = number
}
variable "public_subnet" {
  type = list(string) 
}

variable "instance_count" {
  type = number
  description = "we are providing instance count "
}
variable "instance_type" {
  type = string
  description = "instance t2.micro"
}
variable "key_name" {
  description = "pem Key pair"
  type = string
}
variable "security_groups" {
  type        = list(string)
}
variable "vpc_id" {
  description = "ID of the VPC"
}

variable "ec2_ami" {
  type = string
}
variable "public_subnet" {
  type = list(string)
}

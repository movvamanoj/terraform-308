variable "key_name" {
  description = "pem Key pair"
  type = string
}

variable "public_subnet" {
  type = list(string)
}
variable "instance_type" {
  type = string
  description = "instance t2.micro"
}
variable "nat_ami" {
  type = string
  description = "instance ami"
}

variable "security_groups" {
  type        = list(string)
}

variable "vpc_id" {
    type = string
}
variable "nat_instance_count" {
  type = number
  description = "we are providing instance count "
}
provider "aws" {
  region = "us-east-1" # Set your desired AWS region here
}
data "aws_availability_zones" "available" {
  state = "available"
}

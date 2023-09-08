provider "aws" {
  region = "us-east-1" # Set your desired AWS region here
}
data "aws_availability_zones" "available" {
  state = "available"
}

provider "vault" {
  address = var.vault_address
  token   = var.vault_token
}
data "vault_generic_secret" "aws_rds_postgres_credentials" {
  path = var.vault_path
}



#---------------------------------------------------------------------
# Provider Configuration
#
# Author: movvmanoj
# Created: September 13, 2023
# Copyright (c) 2023 S. All rights
#---------------------------------------------------------------------
# This section includes configurations for AWS, Vault, and Availability Zones.

# AWS Provider Configuration
provider "aws" {
  region = "ap-south-1" # Set your desired AWS region here
}

# Data Source for Availability Zones
data "aws_availability_zones" "available" {
  state = "available"
}

# Vault Provider Configuration
provider "vault" {
  address = var.vault_address
  token   = var.vault_token
}

# Data Source for AWS RDS PostgreSQL Credentials from Vault
data "vault_generic_secret" "aws_rds_postgres_credentials" {
  path = var.vault_path
}

# ------------------------------------------------------------------------
# Note: Make sure to replace the values of variables (e.g., var.vault_address, var.vault_token, etc.)
# with actual values specific to your environment.
# ------------------------------------------------------------------------

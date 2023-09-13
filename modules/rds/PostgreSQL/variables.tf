#---------------------------------------------------------------------
# Terraform Variables Configuration for PostgreSQL RDS
#
# Author: movvmanoj
# Created: September 10, 2023
# Copyright (c) 2023 S. All rights reserved.
#---------------------------------------------------------------------
# This file defines variables used in the Terraform configuration for PostgreSQL RDS.

# List of private subnets to associate with the PostgreSQL RDS instances.
variable "private_subnet" {
    type = list(string) 
}

# ID of the VPC where the PostgreSQL RDS instances will be launched.
variable "vpc_id" {
    type = string  
}

# Number of PostgreSQL RDS instances to create.
variable "postgres_db_count" {
  type = number
  description = "we need to provide postgres_db_count basing on this it will create postgres_dbs" 
}

# Name of the PostgreSQL RDS subnet group.
variable "postgres_subnet_group_name" {
  description = "The name of the PostgreSQL RDS subnet group"
  type        = string
}
# Allocated storage for the PostgreSQL RDS instance.
variable "postgres_allocated_storage" {
  description = "The allocated storage for the PostgreSQL RDS instance"
  type        = number
}
# Storage type for the PostgreSQL RDS instance.
variable "postgres_storage_type" {
  description = "The storage type for the PostgreSQL RDS instance"
  type        = string
}
# Database engine for the PostgreSQL RDS instance.
variable "postgres_engine" {
  description = "The database engine for the PostgreSQL RDS instance"
  type        = string
}
# Engine version for the PostgreSQL RDS instance.
variable "postgres_engine_version" {
  description = "The engine version for the PostgreSQL RDS instance"
  type        = string
}
# Instance class for the PostgreSQL RDS instance.
variable "postgres_instance_class" {
  description = "The instance class for the PostgreSQL RDS instance"
  type        = string
}
# Name of the PostgreSQL database.
variable "postgres_db_name" {
  description = "The name of the PostgreSQL database"
  type        = string
}
# Username for the PostgreSQL database.
variable "postgres_username" {
  description = "The username for the PostgreSQL database"
  type        = string
}
# Password for the PostgreSQL database.
variable "postgres_password" {
  description = "The password for the PostgreSQL database"
  type        = string
}
# Name of the PostgreSQL parameter group.
variable "postgres_parameter_group_name" {
  description = "The name of the PostgreSQL parameter group"
  type        = string
}
# Name of the security group for the PostgreSQL RDS instance.
variable "postgres_db_security_group_name" {
  description = "The name of the security group for the PostgreSQL RDS instance"
  type        = string
}
# Description of the security group for the PostgreSQL RDS instance.
variable "postgres_db_security_group_description" {
  description = "The description of the security group for the PostgreSQL RDS instance"
  type        = string
}

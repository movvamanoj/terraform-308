variable "private_subnet" {
    type = list(string)
  
}
variable "vpc_id" {
    type = string  
}

variable "postgres_db_count" {
  type = number
  description = "we need to provide postgres_db_count basing on this it will create postgres_dbs"
  
}
variable "postgres_subnet_group_name" {
  description = "The name of the PostgreSQL RDS subnet group"
  type        = string
}

variable "postgres_allocated_storage" {
  description = "The allocated storage for the PostgreSQL RDS instance"
  type        = number
}

variable "postgres_storage_type" {
  description = "The storage type for the PostgreSQL RDS instance"
  type        = string
}

variable "postgres_engine" {
  description = "The database engine for the PostgreSQL RDS instance"
  type        = string
}

variable "postgres_engine_version" {
  description = "The engine version for the PostgreSQL RDS instance"
  type        = string
}

variable "postgres_instance_class" {
  description = "The instance class for the PostgreSQL RDS instance"
  type        = string
}

variable "postgres_db_name" {
  description = "The name of the PostgreSQL database"
  type        = string
}


variable "postgres_username" {
  description = "The username for the PostgreSQL database"
  type        = string
}

variable "postgres_password" {
  description = "The password for the PostgreSQL database"
  type        = string
}

variable "postgres_parameter_group_name" {
  description = "The name of the PostgreSQL parameter group"
  type        = string
}

variable "postgres_db_security_group_name" {
  description = "The name of the security group for the PostgreSQL RDS instance"
  type        = string
}

variable "postgres_db_security_group_description" {
  description = "The description of the security group for the PostgreSQL RDS instance"
  type        = string
}

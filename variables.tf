variable "vpc_cidr" {
  description = "ID of the VPC"
  type        = string
}
variable "nat_instance_count" {
  type = number
  description = "we are providing instance count "
}

variable "public_subnet_cidrs_count" {
  description = "List of CIDR blocks for subnets"
  type        = number
}
variable "private_subnet_cidrs_count" {
  description = "List of CIDR blocks for subnets"
  type        = number
}
variable "key_name" {
  description = "pem Key pair"
  type = string
}

variable "instance_type" {
  type = string
  description = "instance t2.micro"
}
variable "nat_ami" {
  type = string
  description = "instance ami"
}
variable "ec2_ami" {
  type = string
  description = "instance ami"
}
# variable "public_cidr_block" {
#   type = list(string)
# }

variable "instance_count" {
  type = number
  description = "we are providing instance count "
  
}

# variable "target_group_names" {
#   type    = list(string)
# }
variable "target_group_count" {
  type    = number
}

variable "alb_count" {
  description = "Number of Availability Zones in the region"
  type = number
}

#########POSTGRESQL
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

# variable "postgres_username" {
#   description = "The username for the PostgreSQL database"
#   type        = string
# }

# variable "postgres_password" {
#   description = "The password for the PostgreSQL database"
#   type        = string
# }

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
variable "postgres_db_count" {
  type = number
  description = "we need to provide postgres_db_count basing on this it will create postgres_dbs"
  
}
 ###vault
variable "vault_address" {
  type = string
}

variable "vault_token" {
  type = string#required
}

variable "vault_path" {
  type = string #required
}

# variable "postgres_db_username" {
#   default = data.vault_generic_secret.aws_rds_postgres_credentials.data["my_postgres_db_username"]
# }

# variable "postgres_db_password" {
#   default = data.vault_generic_secret.aws_rds_postgres_credentials.data["my_postgres_db_password"]
# }
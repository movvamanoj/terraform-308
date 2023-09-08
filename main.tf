module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "public_subnet" {
  source   = "./modules/public_subnet"
  vpc_id   = module.vpc.vpc_id
  vpc_cidr = var.vpc_cidr
  public_subnet_cidrs_count = var.public_subnet_cidrs_count

}

module "private_subnet" {
  source   = "./modules/private_subnet"
  vpc_id   = module.vpc.vpc_id
  vpc_cidr = var.vpc_cidr
  private_subnet_cidrs_count = var.private_subnet_cidrs_count
}

module "ig" {
  source = "./modules/ig"
  vpc_id = module.vpc.vpc_id

}

module "route_tables" {
  source     = "./modules/route_tables"
  vpc_id     = module.vpc.vpc_id
  gateway_id = module.ig.igw_id
  public_subnet = module.public_subnet.public_subnet_ids
  public_subnet_cidrs_count = var.public_subnet_cidrs_count


}


module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "nat_instance" {
  source = "./modules/nat_instance"
  vpc_id = module.vpc.vpc_id
  nat_instance_count = var.nat_instance_count
  public_subnet = module.public_subnet.public_subnet_ids
  key_name = var.key_name
  nat_ami = var.nat_ami
  instance_type = var.instance_type
  security_groups = [module.security_groups.security_group_id]
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  vpc_id = module.vpc.vpc_id
  public_subnet = module.public_subnet.public_subnet_ids
  instance_count = var.instance_count
  instance_type = var.instance_type
  ec2_ami = var.ec2_ami
  key_name = var.key_name
  security_groups = [module.security_groups.security_group_id]
}
# Module "target_group" Configuration
# This module block configures the target_group module, which sets up an AWS Application Load Balancer target group.
# It specifies the VPC ID where the target group will be created and provides the list of EC2 instance IDs
# that should be attached to the target group for load balancing.
module "target_group" {
  source = "./modules/target_group"
  vpc_id = module.vpc.vpc_id
  aws_instance_ids = module.ec2_instance.ec2_instance_ids
  # target_group_names = var.target_group_names
  target_group_names = []
  target_group_count = var.target_group_count
  instance_count = var.instance_count
}
module "alb" {
  source              = "./modules/alb"
  vpc_id              = module.vpc.vpc_id
  aws_instance_ids    = module.ec2_instance.ec2_instance_ids
  target_group_arns   = module.target_group.target_group_arns
  security_groups     = [module.security_groups.security_group_id]
  target_group_count = var.target_group_count
  instance_count = var.instance_count
  alb_count = var.alb_count
  subnet_availability_zones = module.public_subnet.subnet_availability_zones
  public_subnet_cidrs_count = var.public_subnet_cidrs_count
  public_subnet = module.public_subnet.public_subnet_ids
  az_count = length(data.aws_availability_zones.available.names)
}

module "rds_postgres" {
  source = "./modules/rds/PostgreSQL"
  private_subnet = module.private_subnet.private_subnet_ids
  vpc_id = module.vpc.vpc_id
  postgres_db_count             = var.postgres_db_count
  postgres_subnet_group_name    = var.postgres_subnet_group_name
  postgres_allocated_storage    = var.postgres_allocated_storage
  postgres_storage_type         = var.postgres_storage_type
  postgres_engine               = var.postgres_engine
  postgres_engine_version       = var.postgres_engine_version
  postgres_instance_class       = var.postgres_instance_class
  postgres_db_name              = var.postgres_db_name
  postgres_username             = data.vault_generic_secret.aws_rds_postgres_credentials.data["my_postgres_db_username"]
  postgres_password             = data.vault_generic_secret.aws_rds_postgres_credentials.data["my_postgres_db_password"]
  # postgres_username = module.vault_secrets.postgres_username #we can pass value from output
  # postgres_password = module.vault_secrets.postgres_password
  postgres_parameter_group_name = var.postgres_parameter_group_name
  postgres_db_security_group_name        = var.postgres_db_security_group_name
  postgres_db_security_group_description = var.postgres_db_security_group_description
}
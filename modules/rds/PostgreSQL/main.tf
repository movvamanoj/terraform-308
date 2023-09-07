resource "aws_db_subnet_group" "postgres" {
  count      = var.postgres_db_count
  name       = "${var.postgres_subnet_group_name}-${count.index}"
  # name       = var.postgres_subnet_group_name
  subnet_ids = var.private_subnet
  tags = {
    Name = "my-db-subnet-group-308-${count.index}"
  }
}
resource "aws_security_group" "db_security_group" {
  # count = var.postgres_db_count
  # name        = "${var.postgres_db_security_group_name}-${count.index}"
  # description = "${var.postgres_db_security_group_description}-${count.index}"
  name        = var.postgres_db_security_group_name
  description = var.postgres_db_security_group_description
  vpc_id      = var.vpc_id
  # Ingress (inbound) rules
  # Example rule allowing incoming PostgreSQL traffic (adjust CIDR blocks and ports as needed)
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]  # Adjust the CIDR blocks as needed
  }
  
}

resource "aws_db_instance" "postgres" {
  count               = var.postgres_db_count
  allocated_storage    = var.postgres_allocated_storage
  storage_type         = var.postgres_storage_type
  engine               = var.postgres_engine
  engine_version       = var.postgres_engine_version
  instance_class       = var.postgres_instance_class
  identifier          = "${var.postgres_db_name}-${count.index}"
  # identifier           = var.postgres_db_name
  username             = var.postgres_username
  password             = var.postgres_password
  parameter_group_name = var.postgres_parameter_group_name
  skip_final_snapshot  = true
  deletion_protection = false  # Disable delete protection
  # db_subnet_group_name = aws_db_subnet_group.postgres.name
  vpc_security_group_ids = [aws_security_group.db_security_group.id]
  db_subnet_group_name = aws_db_subnet_group.postgres[count.index].name  # Use count.index to reference the correct subnet group
  # vpc_security_group_ids = [aws_security_group.db_security_group[count.index].id]  # Use count.index to reference the correct security group

  tags = {
    Name = "my-db-instance-308-${count.index}"
  }
}
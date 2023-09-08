resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  tags = {
    Name = "Public-Route-Table-308"
  }
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  tags = {
    Name = "Private-Route-Table-308"
  }
}

resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.gateway_id
    
  }

  resource "aws_route_table_association" "public_subnets" {
    count = var.public_subnet_cidrs_count
    subnet_id = var.public_subnet[0]
    route_table_id = aws_route_table.public.id
  }



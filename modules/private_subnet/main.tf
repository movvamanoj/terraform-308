data "aws_availability_zones" "available"{}
resource "aws_subnet" "private" {
  count             = var.private_subnet_cidrs_count
  vpc_id            = var.vpc_id
  cidr_block        =  "10.0.2${count.index}.0/24"
  # availability_zone = element(data.aws_availability_zones.available.names, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]

  tags = {
    Name = "private-Subnet-308-${count.index}"
  }
}



data "aws_availability_zones" "available" {}

resource "aws_subnet" "public" {
  count             = var.public_subnet_cidrs_count
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.1${count.index}.0/24"
  # availability_zone = data.aws_availability_zones.available.names[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]

  map_public_ip_on_launch = true
  tags = {
    Name = "Public-Subnet-308-${count.index}"
  }
}



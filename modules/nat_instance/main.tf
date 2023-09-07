resource "aws_instance" "nat_instance" {
  count         = var.nat_instance_count
  ami           = var.nat_ami  # Replace with the AMI ID of your NAT instance
  instance_type = var.instance_type               # Change to your desired instance type
  subnet_id     = var.public_subnet[0]
  key_name      = var.key_name    # Change to your key pair name
  security_groups = var.security_groups
  tags = {
    Name = "NAT_EC2Instance-308-${count.index + 1}"
  }
}
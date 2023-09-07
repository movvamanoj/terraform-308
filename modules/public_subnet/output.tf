output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}
output "subnet_availability_zones" {
  value = data.aws_availability_zones.available.names
}

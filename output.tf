output "az_count" {
  value = data.aws_availability_zones.available.names
}
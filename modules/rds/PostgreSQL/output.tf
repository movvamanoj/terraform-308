# output "rds_endpoint" {
#   description = "The endpoint of the RDS PostgreSQL instance"
#   value       = aws_db_instance.postgres.endpoint
# }

# output "rds_instance_id" {
#   description = "The ID of the RDS PostgreSQL instance"
#   value       = aws_db_instance.postgres.id
# }

output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.postgres[*].endpoint  # Replace [0] with the desired instance index
}
output "rds_instance_id" {
  description = "The ID of the RDS instance"
  value       = aws_db_instance.postgres[*].id
}

output "rds_security_group_id" {
  description = "The ID of the security group associated with the RDS instance"
  value       = aws_security_group.db_security_group.id
}

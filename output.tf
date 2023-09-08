output "az_count" {
  value = data.aws_availability_zones.available.names
}

# output "postgres_username" {
#   value = data.vault_generic_secret.aws_rds_postgres_credentials.data["my_postgres_db_username"]
# }

# output "postgres_password" {
#   value = data.vault_generic_secret.aws_rds_postgres_credentials.data["my_postgres_db_password"]
# }
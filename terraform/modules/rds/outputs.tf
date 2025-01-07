output "db_instance_endpoint" {
  description = "Endpoint de la instancia de base de datos"
  value       = aws_db_instance.main.endpoint
}

output "db_instance_id" {
  description = "ID de la instancia de base de datos"
  value       = aws_db_instance.main.id
}

output "db_instance_address" {
  description = "Dirección de la instancia de base de datos"
  value       = aws_db_instance.main.address
}

output "rds_endpoint" {
  description = "Endpoint do banco de dados RDS"
  value       = aws_db_instance.vehicles_rds.address
}
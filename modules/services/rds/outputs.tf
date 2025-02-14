output "rds_instance_id" {
  description = "The ID of the RDS instance"
  value       = aws_db_instance.database.id
}

output "rds_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.database.endpoint
}

output "rds_engine" {
  description = "The database engine type"
  value       = aws_db_instance.database.engine
}

output "rds_engine_version" {
  description = "The database engine version"
  value       = aws_db_instance.database.engine_version
}

output "rds_instance_class" {
  description = "The instance type of the RDS instance"
  value       = aws_db_instance.database.instance_class
}

output "rds_vpc_security_groups" {
  description = "The security groups attached to the RDS instance"
  value       = aws_db_instance.database.vpc_security_group_ids
}

output "rds_db_subnet_group" {
  description = "The subnet group associated with the RDS instance"
  value       = aws_db_instance.database.db_subnet_group_name
}
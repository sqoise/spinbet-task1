output "instance_id" {
  value       = aws_instance.web.id
  description = "The ID of the EC2 instance"
}

output "public_ip" {
  value       = aws_instance.web.public_ip
  description = "The public IP of the EC2 instance (if applicable)"
}

output "private_ip" {
  value       = aws_instance.web.private_ip
  description = "The private IP of the EC2 instance"
}

output "instance_arn" {
  value       = aws_instance.web.arn
  description = "The ARN of the EC2 instance"
}

output "instance_state" {
  value       = aws_instance.web.instance_state
  description = "The current state of the EC2 instance"
}

output "security_group_ids" {
  value       = aws_instance.web.vpc_security_group_ids
  description = "The security group IDs attached to the EC2 instance"
}
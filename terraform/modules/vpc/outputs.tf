output "vpc_id" {
  description = "ID de la VPC"
  value       = aws_vpc.this.id
}

output "subnet_id" {
  description = "ID de la subred pública"
  value       = aws_subnet.public.id
}

output "instance_id" {
  description = "ID de la instancia EC2"
  value       = aws_instance.web.id
}

output "instance_public_ip" {
  description = "IP pública de la instancia EC2"
  value       = aws_instance.web.public_ip
}

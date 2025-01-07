output "instance_id" {
  description = "El ID de la instancia EC2"
  value       = aws_instance.instance.id
}

output "instance_public_ip" {
  description = "La dirección IP pública de la instancia EC2"
  value       = aws_instance.instance.public_ip
}

output "instance_private_ip" {
  description = "La dirección IP privada de la instancia EC2"
  value       = aws_instance.instance.private_ip
}

output "instance_public_dns" {
  description = "El nombre DNS público de la instancia EC2"
  value       = aws_instance.instance.public_dns
}

output "instance_private_dns" {
  description = "El nombre DNS privado de la instancia EC2"
  value       = aws_instance.instance.private_dns
}

output "instance_ami" {
  description = "La AMI utilizada para la instancia EC2"
  value       = aws_instance.instance.ami
}

output "instance_type" {
  description = "El tipo de la instancia EC2"
  value       = aws_instance.instance.instance_type
}

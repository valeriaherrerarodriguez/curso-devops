output "vpc_id" {
  description = "VPC creada"
  value       = aws_vpc.main.id
}

output "availability_zones" {
  description = "Availability Zones utilizadas"

  value = [
    aws_subnet.public[0].availability_zone,
    aws_subnet.public[1].availability_zone
  ]
}

output "web_public_ips" {
  description = "IPs publicas de las Web"
  value       = aws_instance.web[*].public_ip
}

output "web_private_ips" {
  description = "IPs privadas de las Web"
  value       = aws_instance.web[*].private_ip
}

output "app_private_ips" {
  description = "IPs privadas de las App"
  value       = aws_instance.app[*].private_ip
}

output "app_public_ips" {
  description = "Las App no deben tener IP publica"
  value       = aws_instance.app[*].public_ip
}
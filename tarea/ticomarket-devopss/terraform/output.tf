output "public_ip" {
  description = "IP publica de la instancia TicoMarket"
  value       = aws_instance.ticomarket.public_ip
}
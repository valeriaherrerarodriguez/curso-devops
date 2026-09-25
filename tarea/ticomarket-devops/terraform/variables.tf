variable "aws_region" {
  description = "Región de AWS"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Nombre del Key Pair de AWS"
  type        = string
}

variable "my_ip" {
  description = "IP pública permitida para SSH"
  type        = string
}
variable "aws_region" {
  description = "Region AWS"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
  default     = "devops-challenge"
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Key Pair existente en AWS"
  type        = string
}

variable "admin_cidr" {
  description = "IP publica autorizada para SSH, terminada en /32"
  type        = string
}
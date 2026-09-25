terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }

  required_version = ">= 1.5.0"
}


provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "ticomarket" {
  name        = "ticomarket-sg"
  description = "Security Group para TicoMarket"

  ingress {
    description = "SSH desde mi IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip}/32"]
  }

  ingress {
    description = "Aplicacion TicoMarket"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ticomarket" {
  ami           = "ami-0f8a61b66d1accaee"
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [
    aws_security_group.ticomarket.id
  ]

  tags = {
    Name = "ticomarket"
  }
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory.ini"

  content = <<-EOT
    [app]
    ${aws_instance.ticomarket.public_ip}

    [app:vars]
    ansible_user=ubuntu
    ansible_ssh_private_key_file=${pathexpand("~/.ssh/ticomarket-key.pem")}
  EOT
}
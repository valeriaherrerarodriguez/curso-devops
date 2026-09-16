# WEB SECURITY GROUP

resource "aws_security_group" "web" {
  name        = "${var.project_name}-web-sg"
  description = "Security Group for Web Tier"
  vpc_id      = aws_vpc.main.id

  # HTTP desde Internet
  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # SSH solamente desde nuestra IP
  ingress {
    description = "SSH from administrator"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  egress {
    description = "Outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-web-sg"
  }
}

# APPLICATION SECURITY GROUP

resource "aws_security_group" "app" {
  name        = "${var.project_name}-app-sg"
  description = "Security Group for Application Tier"
  vpc_id      = aws_vpc.main.id

  # Aplicacion solamente desde Web
  ingress {
    description = "TCP 8080 from Web Tier"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"

    security_groups = [
      aws_security_group.web.id
    ]
  }

  # SSH solamente desde Web para utilizar Jump Host
  ingress {
    description = "SSH from Web Tier"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    security_groups = [
      aws_security_group.web.id
    ]
  }

  egress {
    description = "Outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-app-sg"
  }
}
# BUSCAR UBUNTU AMI

data "aws_ami" "ubuntu" {
  most_recent = true

  owners = [
    "099720109477"
  ]

  filter {
    name = "name"

    values = [
      "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
    ]
  }

  filter {
    name = "virtualization-type"

    values = [
      "hvm"
    ]
  }
}

# WEB TIER

resource "aws_instance" "web" {
  count = 2

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.public[count.index].id

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  key_name = var.key_name

  root_block_device {
    volume_type = "gp3"
    volume_size = 8
    encrypted   = true
  }

  tags = {
    Name        = "web-${count.index + 1}"
    Tier        = "Web"
    Environment = "Challenge"
  }
}

# APPLICATION TIER

resource "aws_instance" "app" {
  count = 2

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.private[count.index].id

  associate_public_ip_address = false

  vpc_security_group_ids = [
    aws_security_group.app.id
  ]

  key_name = var.key_name

  root_block_device {
    volume_type = "gp3"
    volume_size = 8
    encrypted   = true
  }

  tags = {
    Name        = "app-${count.index + 1}"
    Tier        = "App"
    Environment = "Challenge"
  }
}
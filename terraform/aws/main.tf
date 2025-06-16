terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  region = var.aws_region
}

# Lookup the latest official Debian 12 (Bookworm) AMI
data "aws_ami" "debian" {
  most_recent = true
  owners      = ["136693071363"]  # Official Debian images owner

  filter {
    name   = "name"
    values = ["debian-12-amd64-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_security_group" "webApp_sg" {
  name        = "allow_http_ssh"
  description = "Allow inbound HTTP and SSH"

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-webapp-sg"
    Project = "vtd-devops-khangkieu"
  }
}

resource "aws_instance" "khangkieu-webApp" {
  ami                    = data.aws_ami.debian.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webApp_sg.id]

# user_data = user_data.sh

  tags = {
    Name = "terraform-webapp-instance"
    Project = "vtd-devops-khangkieu"
  }
}

output "instance_public_ip" {
  description = "Public IP of the web server"
  value       = aws_instance.khangkieu-webApp.public_ip
}

output "instance_public_dns" {
  description = "Public DNS of the web server"
  value       = aws_instance.khangkieu-webApp.public_dns
}

variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

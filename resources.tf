

# =========================
# SECURITY GROUP
# =========================

resource "aws_security_group" "sg" {
  name        = "chaitanya-sg"
  description = "Allow SSH"
  vpc_id      = "vpc-08583033ea0a82af5"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
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

# =========================
# SUBNET
# =========================

resource "aws_subnet" "main_subnet" {
  vpc_id                  = "vpc-08583033ea0a82af5"
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "chaitanya-subnet"
  }
}

# =========================
# VPC
# =========================

resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = false

  tags = {
    Name = "chaitanya-vpc"
  }
}

# =========================
# EC2
# =========================

resource "aws_instance" "ec2" {
  ami                         = "ami-0d52744d6551d851e"
  instance_type               = "t3.micro"
  subnet_id                   = "subnet-02437a091bd9a6e2b"
  associate_public_ip_address = true

  vpc_security_group_ids = [
    "sg-0b87ca41541fc16a3"
  ]

  tags = {
    Name = "chaitanya-ec2"
  }

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }
}
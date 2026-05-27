terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

# ---------------- VPC ----------------

import {
  to = aws_vpc.main_vpc
  id = "vpc-08583033ea0a82af5"
}

# ---------------- SUBNET ----------------

import {
  to = aws_subnet.main_subnet
  id = "subnet-02437a091bd9a6e2b"
}

# ---------------- SECURITY GROUP ----------------

import {
  to = aws_security_group.sg
  id = "sg-0b87ca41541fc16a3"
}

# ---------------- EC2 ----------------

import {
  to = aws_instance.ec2
  id = "i-0915959ebe12e2432"
}

# ---------------- INTERNET GATEWAY ----------------

import {
  to = aws_internet_gateway.igw
  id = "PASTE_IGW_ID"
}

# ---------------- ROUTE TABLE ----------------

import {
  to = aws_route_table.rt
  id = "PASTE_ROUTE_TABLE_ID"
}

# ---------------- ROUTE TABLE ASSOCIATION ----------------

import {
  to = aws_route_table_association.rta
  id = "PASTE_ASSOCIATION_ID"
}
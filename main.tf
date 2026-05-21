# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
#     }
#   }
# }

# provider "aws" {
#   region = "ap-south-1"
# }

# resource "aws_s3_bucket" "my_bucket" {
#   bucket = "chaitanya-terraform-demo-bucket-2026"

#   tags = {
#     Name        = "My Terraform Bucket"
#     Environment = "Dev"
#   }
# }

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "imported_bucket" {
  bucket = "chaitanya-manual-import-bucket"
}

import {
  to = aws_s3_bucket.imported_bucket
  id = "chaitanya-manual-import-bucket"
}
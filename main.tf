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

import {
  to = aws_s3_bucket.imported_bucket
  id = "chaitanya-manual-import-bucket1"
}
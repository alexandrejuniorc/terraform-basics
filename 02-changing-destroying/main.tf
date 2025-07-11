terraform {
  required_version = "1.12.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.3.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3 = "http://127.0.0.1:4566"
  }
}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "bucket-by-terraform"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Owner       = "Alexandre Junior"
    UpdatedAt   = "2023-10-01"
  }
}

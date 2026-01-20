terraform {
  backend "s3" {
    bucket  = "terraform-state"
    key     = "env:/terraform.tfstate"
    region  = "eu-central-1"
    encrypt = true
    use_lockfile=true
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  # Configuration options
    region = "us-east-1"
}

# Create a S3 bucket
resource "random_id" "bucket_id" {
  byte_length = 4
}
resource "aws_s3_bucket" "tf_test_baivab_bucket" {
  bucket = "my-tf-test-baiv-${random_id.bucket_id.hex}"


  tags = {
    Name        = "My bucket 2.0"
    Environment = "Dev"
  }
}


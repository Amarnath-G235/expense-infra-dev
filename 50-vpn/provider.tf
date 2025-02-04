terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.66.0"
    }
  }
  backend "s3" {
    bucket         = "remote-state-81s"
    key            = "expense-dev-vpn"
    region         = "us-east-1"
    dynamodb_table = "81s-locking"
  }
}
provider "aws" {
  # Configuration options
  region = "us-east-1"
}
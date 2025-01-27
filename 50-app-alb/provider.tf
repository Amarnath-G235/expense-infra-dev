terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.0"
    }
  }
  backend "s3" {
    bucket         = "remote-state-81s"
    key            = "expense-app-alb-dev"
    region         = "us-east-1"
    dynamodb_table = "81s-locking"
  }
}
provider "aws" {
  # Configuration options
  region = "us-east-1"
}
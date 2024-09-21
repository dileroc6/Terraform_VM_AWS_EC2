terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.36.0, <5.47.0"
    }
  }
  required_version = "~>1.9.0"
}

provider "aws" {
  region = "us-west-1"
  default_tags {
    tags = var.tags
  }
}
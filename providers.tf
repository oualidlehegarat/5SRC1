terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.47.0"
    }
  }
}

provider "aws" {
  # Configuration options
  #  region = "${var.aws_region}"
  region     = var.aws_region
  secret_key = var.aws_secret_key
  access_key = var.aws_access_key
  token      = var.aws_token
}

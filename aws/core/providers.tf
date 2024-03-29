terraform {
  required_version = ">= 1.6"

  backend "s3" {
    bucket         = "vrs-factory-terraform"
    key            = "state-aws-vrsfactory.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "vrs-factory-terraform"

    encrypt                 = true
    access_key              = var.aws_access_key
    secret_key              = var.aws_secret_key
    skip_metadata_api_check = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.36"
    }
  }
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

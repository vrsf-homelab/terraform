terraform {
  required_version = ">= 1.6"

  backend "s3" {
    bucket         = "vrs-factory-terraform"
    key            = "state-cloudflare-vrsfactorypl.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "vrs-factory-terraform"

    encrypt                 = true
    access_key              = var.aws_access_key
    secret_key              = var.aws_secret_key
    skip_metadata_api_check = true
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.25"
    }
  }
}

provider "cloudflare" {
  api_token = var.api_token
}

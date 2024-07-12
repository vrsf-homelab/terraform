terraform {
  required_version = ">= 1.6"

  backend "s3" {
    bucket         = "vrs-factory-terraform"
    key            = "state-proxmox-vlt.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "vrs-factory-terraform"

    encrypt                 = true
    access_key              = var.aws_access_key
    secret_key              = var.aws_secret_key
    skip_metadata_api_check = true
  }

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "4.3.0"
    }
  }
}

provider "vault" {
  address = var.vault_address
  token   = var.vault_token
}

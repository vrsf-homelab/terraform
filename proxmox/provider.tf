terraform {
  required_version = ">= 1.6"

  backend "s3" {
    bucket         = "vrs-factory-terraform"
    key            = "state-proxmox.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "vrs-factory-terraform"

    encrypt                 = true
    access_key              = var.aws_access_key
    secret_key              = var.aws_secret_key
    skip_metadata_api_check = true
  }

  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://10.69.30.10:8006/api2/json"

  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
}
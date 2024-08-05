terraform {
  required_version = ">= 1.6"

  backend "gcs" {
    bucket = "vrsf-homelab-terraform"
    prefix = "vault"
  }

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "4.3.0"
    }
  }
}

provider "vault" {
  address         = var.vault_address
  token           = var.vault_token
  skip_tls_verify = true
}

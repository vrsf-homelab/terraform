terraform {
  required_version = ">= 1.6"

  backend "gcs" {
    bucket = "vrsf-homelab-terraform"
    prefix = "authentik"
  }

  required_providers {
    authentik = {
      source  = "goauthentik/authentik"
      version = "2024.8.4"
    }
  }
}

provider "authentik" {
  url   = var.authentik_url
  token = var.authentik_token
}

provider "random" {}

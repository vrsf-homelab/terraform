terraform {
  required_version = ">= 1.6"

  backend "gcs" {
    bucket = "vrsf-homelab-terraform"
    prefix = "cloudflare"
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

terraform {
  required_version = ">= 1.6"

  backend "gcs" {
    bucket = "vrsf-homelab-terraform"
    prefix = "proxmox/freelance"
  }

  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc3"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.25"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://10.0.20.31:8006/api2/json"

  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret

  pm_parallel = 10

  pm_log_enable = true
  pm_log_file   = "../../../.local-data/terraform-plugin-proxmox.log"
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

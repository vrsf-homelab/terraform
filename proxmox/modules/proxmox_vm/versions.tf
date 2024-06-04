terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc2"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.25"
    }
  }
}

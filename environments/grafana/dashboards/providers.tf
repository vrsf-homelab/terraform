terraform {
  required_version = ">= 1.6"

  backend "gcs" {
    bucket = "vrsf-homelab-terraform"
    prefix = "grafana/dashboard"
  }

  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "~> 3.13"
    }
  }
}

provider "grafana" {
  url  = var.grafana_url
  auth = var.grafana_token
}

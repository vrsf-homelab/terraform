locals {
  # Extract IP for Cloudflare from Proxmox format: `ip=0.0.0.0/0,gw=0.0.0.0`
  ip_match = regex("ip=([0-9.]+)/[0-9]+", var.ip)
  ip       = local.ip_match[0]

  hostname = "${var.name}-ip-${replace(local.ip, ".", "-")}"
}

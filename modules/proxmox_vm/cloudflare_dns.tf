data "cloudflare_zone" "vrsf_in" {
  account_id = var.cloudflare_account_id
  name       = "vrsf.in"
}

resource "cloudflare_record" "vm_dns_record" {
  depends_on = [proxmox_vm_qemu.vm]

  zone_id = data.cloudflare_zone.vrsf_in.id
  name    = "${var.name}.vm"
  value   = var.ip
  type    = "A"
  proxied = false
  comment = "Managed by Proxmox provisioner"
}

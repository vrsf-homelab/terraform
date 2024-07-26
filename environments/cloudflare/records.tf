###
##  G E N E R A L
###
resource "cloudflare_record" "www_cname_vrsfactorydev" {
  zone_id = cloudflare_zone.default.id
  name    = "@"
  value   = "vrs-factory.dev"
  type    = "CNAME"
  proxied = true
  comment = local.comment
}

###
##  A D G U A R D
###
resource "cloudflare_record" "adguard_panel" {
  zone_id = cloudflare_zone.default.id
  name    = "adguard"
  value   = "10.0.30.53"
  type    = "A"
  proxied = false
  comment = local.comment
}


###
##  P R O X M O X
###
resource "cloudflare_record" "proxmox_crimson" {
  zone_id = cloudflare_zone.default.id
  name    = "crimson.pve"
  value   = "10.0.20.31"
  type    = "A"
  proxied = false
  comment = local.comment
}

resource "cloudflare_record" "proxmox_emerald" {
  zone_id = cloudflare_zone.default.id
  name    = "emerald.pve"
  value   = "10.0.20.32"
  type    = "A"
  proxied = false
  comment = local.comment
}


###
##  H O M E L A B
###
resource "cloudflare_record" "kubernetes_cluster" {
  zone_id = cloudflare_zone.default.id
  name    = "k8s"
  value   = "10.0.30.10"
  type    = "A"
  proxied = false
  comment = local.comment
}

resource "cloudflare_record" "kubernetes_ingress" {
  zone_id = cloudflare_zone.default.id
  name    = "*"
  value   = "10.0.31.10"
  type    = "A"
  proxied = false
  comment = local.comment
}

resource "cloudflare_record" "vault_cluster" {
  zone_id = cloudflare_zone.default.id
  name    = "vlt"
  value   = "10.0.30.11"
  type    = "A"
  proxied = false
  comment = local.comment
}


###
##  S Y N O L O G Y
###
resource "cloudflare_record" "synology_panel" {
  zone_id = cloudflare_zone.default.id
  name    = "storage"
  value   = "10.0.20.30"
  type    = "A"
  proxied = false
  comment = local.comment
}

resource "cloudflare_record" "synology_plex" {
  zone_id = cloudflare_zone.default.id
  name    = "plex"
  value   = "10.0.20.30"
  type    = "A"
  proxied = false
  comment = local.comment
}

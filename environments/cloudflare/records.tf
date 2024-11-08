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
resource "cloudflare_record" "proxmox_alpha" {
  zone_id = cloudflare_zone.default.id
  name    = "alpha.pve"
  value   = "10.0.20.31"
  type    = "A"
  proxied = false
  comment = local.comment
}

resource "cloudflare_record" "proxmox_beta" {
  zone_id = cloudflare_zone.default.id
  name    = "beta.pve"
  value   = "10.0.20.32"
  type    = "A"
  proxied = false
  comment = local.comment
}

resource "cloudflare_record" "proxmox_charlie" {
  zone_id = cloudflare_zone.default.id
  name    = "charlie.pve"
  value   = "10.0.20.33"
  type    = "A"
  proxied = false
  comment = local.comment
}

resource "cloudflare_record" "proxmox_tango" {
  zone_id = cloudflare_zone.default.id
  name    = "tango.pve"
  value   = "10.0.20.34"
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
  value   = "10.0.30.20"
  type    = "A"
  proxied = false
  comment = local.comment
}

resource "cloudflare_record" "kubernetes_ingress" {
  zone_id = cloudflare_zone.default.id
  name    = "*"
  value   = "10.0.30.21"
  type    = "A"
  proxied = false
  comment = local.comment
}

resource "cloudflare_record" "vault_node" {
  count = 3

  zone_id = cloudflare_zone.default.id
  name    = "n${count.index + 1}.vlt"
  value   = "10.0.31.1${count.index + 1}"
  type    = "A"
  proxied = false
  comment = local.comment
}

resource "cloudflare_record" "gitlab" {
  zone_id = cloudflare_zone.default.id
  name    = "gitlab"
  value   = "10.0.31.101"
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

resource "cloudflare_record" "synology_ldap" {
  zone_id = cloudflare_zone.default.id
  name    = "ldap"
  value   = "10.0.20.30"
  type    = "A"
  proxied = false
  comment = local.comment
}

resource "cloudflare_record" "synology_dex" {
  zone_id = cloudflare_zone.default.id
  name    = "dex"
  value   = "10.0.20.30"
  type    = "A"
  proxied = false
  comment = local.comment
}

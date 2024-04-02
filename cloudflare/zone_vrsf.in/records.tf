###
##  G E N E R A L
###
resource "cloudflare_record" "www_cname_vrsfactorydev" {
  zone_id = cloudflare_zone.default.id
  name    = "@"
  value   = "vrs-factory.dev"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "www_cname_star_vrsfactorydev" {
  zone_id = cloudflare_zone.default.id
  name    = "*"
  value   = "10.69.35.2"
  type    = "A"
  proxied = false
}


###
##  A D G U A R D
###
resource "cloudflare_record" "adguard_panel" {
  zone_id = cloudflare_zone.default.id
  name    = "adguard"
  value   = "10.69.20.53"
  type    = "A"
  proxied = false
}


###
##  P R O X M O X
###
resource "cloudflare_record" "proxmox_panel" {
  zone_id = cloudflare_zone.default.id
  name    = "crimson.pve"
  value   = "10.69.30.10"
  type    = "A"
  proxied = false
}


###
##  K U B E R N E T E S
###
resource "cloudflare_record" "k8s_cluster" {
  zone_id = cloudflare_zone.default.id
  name    = "k8s"
  value   = "10.69.35.1"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "tunnel_argocd" {
  zone_id = cloudflare_zone.default.id
  name    = "acd"
  value   = "1da6a66c-a33c-42fb-addb-9443fb26fe53.cfargotunnel.com"
  type    = "CNAME"
  proxied = true
}


###
##  S Y N O L O G Y
###
resource "cloudflare_record" "synology_panel" {
  zone_id = cloudflare_zone.default.id
  name    = "storage"
  value   = "10.69.20.1"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "synology_plex" {
  zone_id = cloudflare_zone.default.id
  name    = "plex"
  value   = "10.69.20.1"
  type    = "A"
  proxied = false
}

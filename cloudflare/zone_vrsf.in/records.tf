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

resource "cloudflare_record" "star_cname_vrsfactorydev" {
  zone_id = cloudflare_zone.default.id
  name    = "*"
  value   = "vrs-factory.dev"
  type    = "CNAME"
  proxied = true
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

resource "cloudflare_record" "adguard_acme_challenge" {
  zone_id = cloudflare_zone.default.id
  name    = "_acme-challenge.adguard"
  value   = "mWIP76zirXupe5h13jfYx5evKk3l_b9a6WKKygbee_c"
  type    = "TXT"
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
resource "cloudflare_record" "k3s_cluster_aden" {
  zone_id = cloudflare_zone.default.id
  name    = "k3s"
  value   = "10.69.30.50"
  type    = "A"
  proxied = false
} 

resource "cloudflare_record" "k3s_cluster_giran" {
  zone_id = cloudflare_zone.default.id
  name    = "k3s"
  value   = "10.69.30.51"
  type    = "A"
  proxied = false
} 

resource "cloudflare_record" "k3s_prometheus" {
  zone_id = cloudflare_zone.default.id
  name    = "prom.k3s"
  value   = "10.69.31.1"
  type    = "A"
  proxied = false
}

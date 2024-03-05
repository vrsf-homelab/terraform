###
##  G E N E R A L
###
resource "cloudflare_record" "a_mydevil" {
  zone_id = cloudflare_zone.default.id
  name    = "@"
  value   = "31.186.83.164"
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "www_cname_base" {
  zone_id = cloudflare_zone.default.id
  name    = "www"
  value   = "vrs-factory.pl"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "star_cname_base" {
  zone_id = cloudflare_zone.default.id
  name    = "*"
  value   = "vrs-factory.pl"
  type    = "CNAME"
  proxied = true
}


###
##  E M A I L
###
resource "cloudflare_record" "domain_mx" {
  zone_id  = cloudflare_zone.default.id
  name     = "@"
  value    = "mail19.mydevil.net"
  type     = "MX"
  priority = 10
}

resource "cloudflare_record" "_dmarc" {
  zone_id = cloudflare_zone.default.id
  name    = "_dmarc"
  value   = "v=DMARC1; p=none; rua=mailto:e4885ef89e1c41fe9a19d0f1b4b32051@dmarc-reports.cloudflare.net"
  type    = "TXT"
}

resource "cloudflare_record" "spf" {
  zone_id = cloudflare_zone.default.id
  name    = "@"
  value   = "v=spf1 mx a include:mail19.mydevil.net -all"
  type    = "TXT"
}

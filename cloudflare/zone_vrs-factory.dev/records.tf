###
##  G E N E R A L
###
resource "cloudflare_record" "www_cname_base" {
  zone_id = cloudflare_zone.default.id
  name    = "www"
  value   = "vrs-factory.dev"
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

resource "cloudflare_record" "devil_domainkey" {
  zone_id = cloudflare_zone.default.id
  name    = "devil._domainkey"
  value   = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDO98ru3YHh3aEjpSIDDOEc3MIQnBDwLwJLPoxauKFhIHrTnaze4QPYJBlblUvRktfwdxOTbNpCS8putUYsWvozh2uQFIbMh1VRL1cBUPDBB7LHvdDi7w299WDGEhoqH0+qil8rLs1CNhwMhDJRJuvk5K4iZ5RQwcFZeQsMfECc5wIDAQAB;"
  type    = "TXT"
}

resource "cloudflare_record" "_dmarc" {
  zone_id = cloudflare_zone.default.id
  name    = "_dmarc"
  value   = "v=DMARC1; p=none; rua=mailto:5cd13401e34a48b3a9c0a348a2ed01e2@dmarc-reports.cloudflare.net"
  type    = "TXT"
}

resource "cloudflare_record" "spf" {
  zone_id = cloudflare_zone.default.id
  name    = "@"
  value   = "v=spf1 mx a include:mail19.mydevil.net -all"
  type    = "TXT"
}


###
##  G I T H U B  P A G E S
###
resource "cloudflare_record" "github" {
  for_each = toset([
    "185.199.111.153",
    "185.199.110.153",
    "185.199.109.153",
    "185.199.108.153"
  ])

  zone_id = cloudflare_zone.default.id
  name    = "@"
  value   = each.key
  type    = "A"
  proxied = true
}

###
##  V E R I F I C A T I O N
###
resource "cloudflare_record" "_github_pages_challenge_vertisan" {
  zone_id = cloudflare_zone.default.id
  name    = "_github-pages-challenge-vertisan"
  value   = "b44fe8be9e20856029edef167245b9"
  type    = "TXT"
}

resource "cloudflare_record" "google_site_verification" {
  zone_id = cloudflare_zone.default.id
  name    = "@"
  value   = "google-site-verification=AhJx-YYifFwk8DOWEkG6mRYvCU8rNEZlsgSBlSLDpBg"
  type    = "TXT"
  ttl     = 3600
}

resource "cloudflare_record" "k_to_aws" {
  for_each = toset([
    "ns-236.awsdns-29.com",
    "ns-926.awsdns-51.net",
    "ns-1592.awsdns-07.co.uk",
    "ns-1493.awsdns-58.org",
  ])

  zone_id = cloudflare_zone.default.id
  name    = "k"
  type    = "NS"
  value   = each.key
  ttl     = 3600
}

resource "cloudflare_zone" "default" {
  zone       = local.domain
  account_id = local.account_id
}

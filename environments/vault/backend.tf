resource "vault_auth_backend" "approle" {
  type = "approle"
  path = "approle"
}

resource "vault_auth_backend" "userpass" {
  type = "userpass"
  path = "userpass"
  tune {
    default_lease_ttl = "2h"
    max_lease_ttl     = "24h"
  }
}

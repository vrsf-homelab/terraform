# `vault auth enable approle`
resource "vault_auth_backend" "homelab_approle" {
  type        = "approle"
  description = "Homelab AppRole authentication"

  tune {
    default_lease_ttl = "3h"
    max_lease_ttl     = "24h"
  }
}

resource "vault_approle_auth_backend_role" "homelab_ro" {
  role_name      = "homelab_ro"
  backend        = vault_auth_backend.homelab_approle.path
  token_ttl      = 2 * 3600      # 2h
  token_max_ttl  = 7 * 24 * 3600 # 7d
  token_policies = ["default", vault_policy.homelab_kv_ro.name]
}

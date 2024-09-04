resource "vault_approle_auth_backend_role" "kubernetes_ro" {
  role_name      = "kubernetes-ro"
  backend        = vault_auth_backend.approle.path
  token_ttl      = 2 * 3600      # 2h
  token_max_ttl  = 7 * 24 * 3600 # 7d
  token_policies = ["default", vault_policy.kubernetes_kv_ro.name]
}

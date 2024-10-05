resource "vault_identity_group" "admin" {
  name     = "admin"
  policies = [vault_policy.admin.name]
}

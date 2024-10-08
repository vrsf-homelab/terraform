resource "vault_identity_group" "admin" {
  name     = "admin"
  policies = [vault_policy.head_admin.name]
  type     = "external"
}

resource "vault_identity_group_alias" "oidc_admin" {
  name           = "authentik_vault_admin"
  mount_accessor = vault_jwt_auth_backend.oidc.accessor
  canonical_id   = vault_identity_group.admin.id
}

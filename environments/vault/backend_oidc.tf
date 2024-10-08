resource "vault_jwt_auth_backend" "oidc" {
  type = "oidc"
  path = "oidc"

  oidc_discovery_url = "https://auth.vrsf.in/application/o/vault/"
  oidc_client_id     = var.oidc_client_id
  oidc_client_secret = var.oidc_client_secret

  default_role = "guest"
}

resource "vault_jwt_auth_backend_role" "oidc_role_group" {
  for_each = toset(["admin", "guest"])

  backend   = vault_jwt_auth_backend.oidc.id
  role_name = each.value

  user_claim   = "sub"
  groups_claim = "groups"

  bound_audiences = [var.oidc_client_id]
  allowed_redirect_uris = [
    "${var.vault_address}/ui/vault/auth/oidc/oidc/callback",
    "${var.vault_address}/oidc/callback",
    "http://localhost:8250/oidc/callback",
  ]
  oidc_scopes = ["openid", "email", "profile", "groups"]
}

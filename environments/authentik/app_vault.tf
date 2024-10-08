##    V A U L T
## ********************************************
module "app_vault" {
  source = "./modules/application"

  name = "Vault"

  provider_signing_key        = "750d048d-88b8-4463-bd72-d304cbc73022"
  provider_authorization_flow = data.authentik_flow.default_provider_authorization_implicit_consent.id
  provider_redirect_uris = [
    "${var.vrs_vault_url}/ui/vault/auth/oidc/oidc/callback",
    "${var.vrs_vault_url}/oidc/callback",
    "http://localhost:8250/oidc/callback",
  ]
  provider_property_mappings = [
    data.authentik_property_mapping_provider_scope.scope_email.id,
    data.authentik_property_mapping_provider_scope.scope_profile.id,
    data.authentik_property_mapping_provider_scope.scope_openid.id,
    data.authentik_property_mapping_provider_scope.scope_offline.id,
  ]

  app_meta_icon = "/media/public/application-icons/icon_grafana.svg"
  app_groups = [
    authentik_group.vault_admin.id,
    authentik_group.vault_guest.id
  ]
}

resource "authentik_group" "vault_admin" {
  name = "vault_admin"
}

resource "authentik_group" "vault_guest" {
  name = "vault_guest"
}

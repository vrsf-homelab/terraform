##    A R G O C D
## ********************************************
module "app_argocd" {
  source = "./modules/application"

  name = "ArgoCD"

  provider_signing_key        = "750d048d-88b8-4463-bd72-d304cbc73022"
  provider_authorization_flow = data.authentik_flow.default_provider_authorization_implicit_consent.id
  provider_redirect_uris = [
    "${var.vrs_argocd_url}/api/dex/callback",
    "http://localhost:8085/auth/callback"
  ]
  provider_property_mappings = [
    data.authentik_property_mapping_provider_scope.scope_email.id,
    data.authentik_property_mapping_provider_scope.scope_profile.id,
    data.authentik_property_mapping_provider_scope.scope_openid.id,
    data.authentik_property_mapping_provider_scope.scope_offline.id,
  ]

  app_meta_icon = "/media/public/application-icons/icon_vault.svg"
  app_groups = [
    authentik_group.argocd_admin.id,
    authentik_group.argocd_viewer.id,
    authentik_group.argocd_guest.id,
  ]
}

resource "authentik_group" "argocd_admin" {
  name = "argocd_admin"
}

resource "authentik_group" "argocd_viewer" {
  name = "argocd_viewer"
}

resource "authentik_group" "argocd_guest" {
  name = "argocd_guest"
}

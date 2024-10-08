##    G R A F A N A
## ********************************************
module "app_grafana" {
  source = "./modules/application"

  name = "Grafana"

  provider_signing_key        = "750d048d-88b8-4463-bd72-d304cbc73022"
  provider_authorization_flow = data.authentik_flow.default_provider_authorization_implicit_consent.id
  provider_redirect_uris = [
    "${var.vrs_grafana_url}/login/generic_oauth"
  ]
  provider_property_mappings = [
    data.authentik_property_mapping_provider_scope.scope_email.id,
    data.authentik_property_mapping_provider_scope.scope_profile.id,
    data.authentik_property_mapping_provider_scope.scope_openid.id,
    data.authentik_property_mapping_provider_scope.scope_offline.id,
  ]

  app_meta_icon = "/media/public/application-icons/icon_grafana.svg"
  app_groups = [
    authentik_group.grafana_admin.id,
    authentik_group.grafana_editor.id,
    authentik_group.grafana_viewer.id
  ]
}

resource "authentik_group" "grafana_admin" {
  name = "grafana_admin"
}

resource "authentik_group" "grafana_editor" {
  name = "grafana_editor"
}

resource "authentik_group" "grafana_viewer" {
  name = "grafana_viewer"
}

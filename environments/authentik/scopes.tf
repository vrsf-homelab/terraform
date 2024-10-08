data "authentik_property_mapping_provider_scope" "scope_email" {
  scope_name = "email"
}

data "authentik_property_mapping_provider_scope" "scope_profile" {
  scope_name = "profile"
}

data "authentik_property_mapping_provider_scope" "scope_openid" {
  scope_name = "openid"
}

data "authentik_property_mapping_provider_scope" "scope_offline" {
  scope_name = "offline_access"
}

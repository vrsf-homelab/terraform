resource "authentik_provider_oauth2" "this" {
  name        = var.name
  client_id   = random_id.this.hex
  signing_key = var.provider_signing_key

  authorization_flow = var.provider_authorization_flow
  redirect_uris      = var.provider_redirect_uris
  property_mappings  = var.provider_property_mappings
}

resource "authentik_application" "this" {
  name              = var.name
  slug              = lower(replace(var.name, " ", "-"))
  protocol_provider = authentik_provider_oauth2.this.id
  meta_icon         = var.app_meta_icon
}

resource "authentik_policy_binding" "app_group_bind" {
  for_each = var.app_groups

  target = authentik_application.this.uuid
  group  = each.value
  order  = 0
}

resource "random_id" "this" {
  byte_length = 16
}

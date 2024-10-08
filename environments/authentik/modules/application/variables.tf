variable "name" {
  type = string
}

variable "provider_signing_key" {
  type = string
}

variable "provider_authorization_flow" {
  type = string
}

variable "provider_redirect_uris" {
  type = list(string)
}

variable "provider_property_mappings" {
  type = list(string)
}

variable "app_meta_icon" {
  type     = string
  nullable = true
  default  = null
}

variable "app_groups" {
  type    = set(string)
  default = []
}

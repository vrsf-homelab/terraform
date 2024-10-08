#### Vault ####
variable "vault_address" {
  type = string
}

variable "vault_token" {
  type = string
}

#### LDAP ####
variable "ldap_bind_dn_pass" {
  type = string
}

#### OIDC ####
variable "oidc_client_id" {
  type = string
}

variable "oidc_client_secret" {
  type = string
}

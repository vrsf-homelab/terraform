resource "vault_ldap_auth_backend" "ldap" {
  url          = "ldap://ldap.vrsf.in"
  insecure_tls = false

  binddn   = "uid=bdn_vault,cn=users,dc=ldap,dc=vrsf,dc=in"
  bindpass = var.ldap_bind_dn_pass

  userdn     = "dc=ldap,dc=vrsf,dc=in"
  userattr   = "uid"
  userfilter = "(&(objectClass=Person)({{.UserAttr}}={{.Username}})(memberOf=cn=vault,cn=groups,dc=ldap,dc=vrsf,dc=in))"

  groupdn     = "cn=groups,dc=ldap,dc=vrsf,dc=in"
  groupfilter = "(|(memberUid={{.Username}})(member={{.UserDN}})(uniqueMember={{.UserDN}}))"
  groupattr   = "cn"

  token_max_ttl          = 10800 // 24h
  token_explicit_max_ttl = 10800 // 24h
}

resource "vault_ldap_auth_backend_group" "vault" {
  backend   = vault_ldap_auth_backend.ldap.path
  groupname = "vault"
  policies  = []
}

resource "vault_ldap_auth_backend_user" "vertisan" {
  backend  = vault_ldap_auth_backend.ldap.path
  username = "vertisan"
  policies = [vault_policy.head_admin.name]
}

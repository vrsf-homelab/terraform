resource "vault_policy" "head_admin" {
  name   = "head_admin"
  policy = data.vault_policy_document.head_admin.hcl
}

data "vault_policy_document" "head_admin" {
  rule {
    path         = "*"
    capabilities = ["create", "read", "list", "update", "delete"]
  }
}

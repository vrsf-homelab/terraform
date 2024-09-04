resource "vault_policy" "kubernetes_kv_ro" {
  name   = "kubernetes_kv_ro"
  policy = data.vault_policy_document.kubernetes_kv_ro.hcl
}

data "vault_policy_document" "kubernetes_kv_ro" {
  rule {
    path         = "${vault_mount.secrets_kv2.path}/kubernetes/*"
    capabilities = ["read"]
  }
}

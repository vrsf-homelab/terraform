resource "vault_policy" "homelab_kv_ro" {
  name   = "homelab_kv_ro"
  policy = data.vault_policy_document.homelab_kv_ro.hcl
}

data "vault_policy_document" "homelab_kv_ro" {
  rule {
    path         = "${vault_mount.homelab_kv2.path}/*"
    capabilities = ["read", "list"]
  }
}

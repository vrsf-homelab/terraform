resource "vault_mount" "secrets_kv2" {
  path = "secrets"
  type = "kv"
  options = {
    version = "2"
  }
}

resource "vault_mount" "homelab_kv2" {
  path = "homelab"
  type = "kv"
  options = {
    version = "2"
  }
}

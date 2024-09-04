resource "vault_mount" "secrets_kv2" {
  path = "secrets"
  type = "kv"
  options = {
    version = "2"
  }
}

# resource "vault_mount" "homelab_kv2" {
#   path = "homelab-secrets"
#   type = "kv"
#   options = {
#     version = "2"
#   }
# }

# resource "vault_kv_secret_backend_v2" "homelab" {
#   mount        = vault_mount.homelab_kv2.path
#   max_versions = 5
# }

# resource "vault_auth_backend" "jenkins_approle" {
#   type = "approle"
# }

# resource "vault_approle_auth_backend_role" "jenkins" {
#   backend        = vault_auth_backend.jenkins_approle.path
#   role_name      = "jenkins"
#   token_policies = [vault_policy.jenkins.name]
# }

# resource "vault_policy" "jenkins" {
#   name   = "jenkins"
#   policy = data.vault_policy_document.jenkins.hcl
# }

# data "vault_policy_document" "jenkins" {
#   rule {
#     path         = "homelab/data/jenkins/*"
#     capabilities = ["read"]
#   }
# }

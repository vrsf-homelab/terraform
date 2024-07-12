resource "vault_policy" "jenkins" {
  name   = "jenkins"
  policy = data.vault_policy_document.jenkins.hcl
}

data "vault_policy_document" "jenkins" {
  rule {
    path         = "auth/approle/role/jenkins/secret-id"
    capabilities = ["read", "create", "update"]
    description  = "Am I required here?"
  }

  rule {
    path         = "homelab-secrets/data/jenkins/*"
    capabilities = ["read"]
  }
}

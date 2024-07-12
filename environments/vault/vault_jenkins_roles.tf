resource "vault_auth_backend" "jenkins_approle" {
  type = "approle"
}

resource "vault_approle_auth_backend_role" "jenkins_approle" {
  backend        = vault_auth_backend.jenkins_approle.path
  role_name      = "jenkins"
  token_policies = [vault_policy.jenkins.name]
}

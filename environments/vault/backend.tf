resource "vault_auth_backend" "approle" {
  type = "approle"
  path = "approle"
}

resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
  path = "kubernetes"
}

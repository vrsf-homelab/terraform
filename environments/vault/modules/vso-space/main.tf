resource "vault_kubernetes_auth_backend_role" "this" {
  role_name                        = "vso-${var.name}"
  bound_service_account_names      = ["vso-auth"]
  bound_service_account_namespaces = [var.namespace]
  token_policies                   = [vault_policy.this.name]
  token_ttl                        = 24 * 3600 # 24h
  # audience                         = "vault"
}

resource "vault_policy" "this" {
  name   = "vso-${var.name}"
  policy = data.vault_policy_document.this.hcl
}

data "vault_policy_document" "this" {
  rule {
    path         = "${var.kv_mount_path}/data/${var.secrets_path}/${var.name}/*"
    capabilities = ["read"]
  }
  rule {
    path         = "${var.kv_mount_path}/metadata/${var.secrets_path}/${var.name}/*"
    capabilities = ["read"]
  }

  ## Deny for '_init' secret
  rule {
    path         = "${var.kv_mount_path}/data/${var.secrets_path}/${var.name}/_init"
    capabilities = ["deny"]
  }
  rule {
    path         = "${var.kv_mount_path}/metadata/${var.secrets_path}/${var.name}/_init"
    capabilities = ["deny"]
  }
}

# It's just an empty secret to init path for mount
resource "vault_kv_secret_v2" "this" {
  mount = var.kv_mount_path
  name  = "${var.secrets_path}/${var.name}/_init"
  data_json = jsonencode({
    init = "just leave this secret empty :)"
  })
}

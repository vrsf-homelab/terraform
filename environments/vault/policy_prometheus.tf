resource "vault_policy" "prometheus_metrics" {
  name   = "prometheus_metrics"
  policy = data.vault_policy_document.prometheus_metrics.hcl
}

data "vault_policy_document" "prometheus_metrics" {
  rule {
    path         = "/sys/metrics"
    capabilities = ["read"]
  }
}

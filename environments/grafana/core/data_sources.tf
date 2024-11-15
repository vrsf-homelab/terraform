###
##  K U B E R N E T E S
###
resource "grafana_data_source" "kubernetes" {
  name       = "Kubernetes"
  type       = "prometheus"
  is_default = true

  url = "https://prometheus.vrsf.in"
  uid = "PA37D07FE30048D3A"

  json_data_encoded = jsonencode({
    cacheLevel                 = "Medium",
    handleGrafanaManagedAlerts = true
  })
}

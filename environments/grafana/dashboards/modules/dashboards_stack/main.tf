resource "grafana_folder" "this" {
  title = var.name
  uid   = var.uid != "" ? var.uid : replace(lower(var.name), " ", "-")
}

resource "grafana_dashboard" "this" {
  for_each = toset(var.dashboards)

  folder = grafana_folder.this.uid

  config_json = each.value
}

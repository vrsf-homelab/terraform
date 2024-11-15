###
##  D E F A U L T
###
resource "grafana_dashboard" "default" {
  for_each = toset(local.dashboards.default.items)

  config_json = each.value
}


###
##  A R G O  C D
###
module "argo_cd" {
  source = "../modules/dashboard"

  name = local.dashboards.argo_cd.name
  uid  = local.dashboards.argo_cd.uid

  dashboards = local.dashboards.argo_cd.items
}


###
##  K U B E R N E T E S
###
module "kubernetes" {
  source = "../modules/dashboard"

  name = local.dashboards.kubernetes.name
  uid  = local.dashboards.kubernetes.uid

  dashboards = local.dashboards.kubernetes.items
}


###
##  I N G R E S S   C O N T R O L L E R
###
module "ingress_controller" {
  source = "../modules/dashboard"

  name = local.dashboards.ingress_controller.name
  uid  = local.dashboards.ingress_controller.uid

  dashboards = local.dashboards.ingress_controller.items
}


###
##  I S T I O
###
# module "istio" {
#   source = "../modules/dashboard"

#   name = local.dashboards.istio.name
#   uid  = local.dashboards.istio.uid

#   dashboards = local.dashboards.istio.items
# }

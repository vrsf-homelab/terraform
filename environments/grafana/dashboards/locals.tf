locals {
  dashboards = {
    default = {
      name = "Default"
      items = [
        file("./dashboards/default/blackbox-general.json"),
        file("./dashboards/default/cert-manager.json"),
        file("./dashboards/default/ga-general.json"),
        file("./dashboards/default/logs.json"),
        file("./dashboards/default/mikrotik-general.json"),
        file("./dashboards/default/proxmox-general.json"),
        file("./dashboards/default/redis.json"),
      ]
    }
    argo_cd = {
      name = "ArgoCD"
      uid  = "argo-cd"
      items = [
        file("./dashboards/argo-cd/general.json"),
        file("./dashboards/argo-cd/application-overview.json"),
        file("./dashboards/argo-cd/operational-overview.json"),
      ]
    }
    kubernetes = {
      name = "Kubernetes"
      uid  = "kubernetes"
      items = [
        file("./dashboards/kubernetes/k8s-general.json"),
        file("./dashboards/kubernetes/k8s-nodes.json"),
        file("./dashboards/kubernetes/k8s-pods.json"),
      ]
    }
    ingress_controller = {
      name = "Ingress Controller"
      uid  = "ingress-controller"
      items = [
        file("./dashboards/ingress-controller/nginx-ingress-controller.json"),
        file("./dashboards/ingress-controller/nginx-ingress-performance.json"),
      ]
    }
    istio = {
      name = "Istio"
      uid  = "istio"
      items = [
        file("./dashboards/istio/istio-control-plane.json"),
        file("./dashboards/istio/istio-mesh.json"),
        file("./dashboards/istio/istio-performance.json"),
        file("./dashboards/istio/istio-service.json"),
        file("./dashboards/istio/istio-wasm-extension.json"),
        file("./dashboards/istio/istio-workload.json"),
        file("./dashboards/istio/istio-ztunnel.json"),
      ]
    }
  }
}

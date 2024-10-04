locals {
  projects = {
    grafana = {
      name      = "ns-grafana"
      namespace = "grafana"
    }
    prometheus-exporter = {
      name      = "ns-prometheus-exporter"
      namespace = "prometheus-exporter"
    }
    cert-manager = {
      name      = "ns-cert-manager"
      namespace = "cert-manager"
    }
    cloudflared = {
      name      = "ns-cloudflared"
      namespace = "cloudflared"
    }
    arc-runners = {
      name      = "ns-arc-runners"
      namespace = "arc-runners"
    }
    jenkins = {
      name      = "ns-jenkins"
      namespace = "jenkins"
    }
    argo = {
      name      = "ns-argo"
      namespace = "argo-system"
    }
    example = {
      name      = "ns-example"
      namespace = "example"
    }
  }
}

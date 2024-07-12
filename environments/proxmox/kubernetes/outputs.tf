output "k8s_cluster_nodes" {
  value = {
    master = [for node in module.k8s_master_node : node.id]
    worker = [for node in module.k8s_worker_node : node.id]
  }
}

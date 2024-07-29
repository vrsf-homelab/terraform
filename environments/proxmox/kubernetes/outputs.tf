output "k8s_cluster_nodes" {
  value = {
    control_plane = [for node in module.k8s_cluster_cp : node.id]
    node          = [for node in module.k8s_cluster_node : node.id]
  }
}


module "k8s_worker_node" {
  source = "../../../modules/proxmox_vm"

  for_each = {
    for index, record in local.k8s_cluster_worker_map : index => record
  }

  id   = 1100 + each.key
  name = "k3s-worker-${each.key + 1}"
  tags = ["k3s_worker"]

  pve_node         = each.value.pve
  vm_template_name = "ubuntu-noble-cloudinit"

  memory    = each.value.node.memory
  cores     = each.value.node.cores
  disk_size = each.value.node.size

  ip = each.value.node.ip

  cloudflare_account_id = var.cloudflare_account_id
}

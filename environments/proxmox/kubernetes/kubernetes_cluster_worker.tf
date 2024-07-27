module "k8s_worker_node" {
  source = "../../../modules/proxmox_vm"

  for_each = {
    for index, value in local.k8s_cluster.worker : index => value
  }

  id   = each.value.id
  name = "k3s-worker-${each.key + 1}"
  tags = ["k3s_worker"]

  pve_node         = each.value.node
  vm_template_name = local.vm_template_name

  memory       = each.value.memory
  cores        = each.value.cores
  disk_size    = each.value.size
  storage_name = local.storage_name

  ip = "ip=${each.value.ip}/16,gw=10.0.0.1"

  cloudflare_account_id = var.cloudflare_account_id
}

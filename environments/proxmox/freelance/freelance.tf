module "freelance_vm" {
  source = "../../../modules/proxmox_vm"

  for_each = {
    for index, value in local.freelance_nodes : index => value
  }

  id   = each.value.id
  name = "freelance-${each.key + 1}"
  tags = ["freelance"]

  pve_node         = each.value.node
  vm_template_name = local.vm_template_name

  memory       = each.value.memory
  cores        = each.value.cores
  disk_size    = each.value.size
  storage_name = local.storage_name

  ip = "ip=${each.value.ip}/16,gw=10.0.0.1"

  cloudflare_account_id = var.cloudflare_account_id
}

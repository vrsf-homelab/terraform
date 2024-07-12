module "load_balancer_vm" {
  source = "../../../modules/proxmox_vm"

  for_each = local.vm_nodes

  id   = 100 + index(keys(local.vm_nodes), each.key)
  name = "${local.vm_specs.name_prefix}-${index(keys(local.vm_nodes), each.key) + 1}"
  tags = local.vm_specs.tags

  pve_node         = each.key
  vm_template_name = "ubuntu-noble-cloudinit"

  memory    = local.vm_specs.memory
  cores     = local.vm_specs.cores
  disk_size = local.vm_specs.size

  ip = each.value

  cloudflare_account_id = var.cloudflare_account_id
}

output "id" {
  value = proxmox_vm_qemu.vm.id
}

output "name" {
  value = var.name
}

output "hostname" {
  value = local.hostname
}

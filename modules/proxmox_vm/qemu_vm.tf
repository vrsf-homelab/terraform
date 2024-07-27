resource "proxmox_vm_qemu" "vm" {
  ## Base
  vmid = var.id
  name = var.name
  tags = join(";", var.tags)

  ## Target PVE
  target_node = var.pve_node
  clone       = var.vm_template_name
  full_clone  = true

  agent   = 1
  os_type = "l26"
  bios    = "seabios"

  ## Memory
  memory = var.memory

  ## CPUs
  cores = var.cores
  cpu   = "host"

  ## Network
  ipconfig0 = var.ip

  ## Storage
  scsihw   = "virtio-scsi-single"
  bootdisk = "order=scsi0"

  disks {
    ide {
      ide0 {
        cloudinit {
          storage = var.storage_name
        }
      }
    }

    scsi {
      scsi0 {
        disk {
          size     = var.disk_size
          storage  = var.storage_name
          iothread = true
        }
      }
    }
  }

  provisioner "remote-exec" {
    inline = [
      "NEW_HOSTNAME=\"${local.hostname}\"",
      "echo \">> Setting hostname: '$NEW_HOSTNAME' ...\"",
      "sudo hostnamectl set-hostname $NEW_HOSTNAME",
      "sudo sed -i \"s/${self.name}/$NEW_HOSTNAME/g\" /etc/hosts 2>/dev/null", # Ignore error about 'unresolved host'
    ]

    connection {
      type  = "ssh"
      host  = self.ssh_host
      port  = self.ssh_port
      user  = "vertisan"
      agent = true
    }
  }

  lifecycle {
    ignore_changes = [
      ciuser,
      sshkeys,
      network,
      disks,
      smbios,
      bootdisk,
      vm_state,
      desc
    ]
  }
}

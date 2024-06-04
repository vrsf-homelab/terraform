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
  os_type = "cloud-init"
  bios    = "ovmf"

  ## Memory
  memory = var.memory

  ## CPUs
  cores = var.cores
  cpu   = "host"

  ## Network
  ipconfig0 = "ip=${var.ip}/16,gw=10.69.0.1"

  ## Storage
  scsihw   = "virtio-scsi-pci"
  bootdisk = "order=scsi0"
  disks {
    ide {
      ide2 {
        cloudinit {
          storage = "local-zfs"
        }
      }
    }

    scsi {
      scsi0 {
        disk {
          size       = var.disk_size
          storage    = "local-zfs"
          emulatessd = true
        }
      }
    }
  }

  provisioner "remote-exec" {
    inline = var.hostname != null ? [
      "NEW_HOSTNAME=\"${local.hostname}\"",
      "echo \">> Setting hostname: $NEW_HOSTNAME\"",
      "sudo hostnamectl set-hostname $NEW_HOSTNAME",
      "sudo sed -i \"s/${self.name}/$NEW_HOSTNAME/g\" /etc/hosts",
      "sudo systemctl reboot"
    ] : ["echo >> Skipping hostname change"]

    connection {
      type        = "ssh"
      host        = self.ssh_host
      private_key = self.ssh_private_key
      user        = "srvadm"
      port        = self.ssh_port
    }
  }

  lifecycle {
    ignore_changes = [
      ciuser,
      sshkeys,
      network,
      disks,
      smbios,
      bootdisk
    ]
  }
}

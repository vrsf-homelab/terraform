variable "name" {
  type        = string
  description = "Name of the VM"
}

variable "hostname" {
  type    = string
  default = null
}

variable "id" {
  type        = number
  description = "Proxmox VM ID"
}

variable "tags" {
  type        = set(string)
  description = "Tags attached to the VM"
  default     = []
}

variable "pve_node" {
  type        = string
  description = "Target Proxmox node"
}

variable "memory" {
  type        = number
  description = "Size of memory"
}

variable "cores" {
  type        = number
  description = "Number of CPU cores"
}

variable "ip" {
  type        = string
  description = "IP address of VM"
}

variable "disk_size" {
  type        = number
  description = "Size of the main disk (GB)"
}

variable "vm_template_name" {
  type    = string
  default = "debian12-cloudinit"
}

variable "cloudflare_account_id" {
  type = string
}

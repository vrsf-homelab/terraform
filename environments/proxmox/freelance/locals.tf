locals {
  vm_template_name = "debian-12.6.0-20240731"
  storage_name     = "local-lvm"

  freelance_nodes = [
    { node = "beta", id = 31101, ip = "10.0.31.101", memory = 4096, cores = 1, size = 50 },
  ]
}

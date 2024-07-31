locals {
  vm_template_name = "debian-12.6.0-20240731"
  storage_name     = "local-lvm"

  load_balancer_nodes = [
    { node = "alpha", id = 3111, ip = "10.0.31.11", memory = 4096, cores = 1, size = 50 },
    { node = "beta", id = 3112, ip = "10.0.31.12", memory = 4096, cores = 1, size = 50 },
  ]
}

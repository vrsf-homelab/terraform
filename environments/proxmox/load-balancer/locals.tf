locals {
  vm_template_name = "debian-12.6.0-20240731"
  storage_name     = "local-lvm"

  load_balancer_nodes = [
    { node = "alpha", id = 3121, ip = "10.0.31.21", memory = 1024, cores = 1, size = 20 },
    { node = "beta", id = 3122, ip = "10.0.31.22", memory = 1024, cores = 1, size = 20 },
  ]
}

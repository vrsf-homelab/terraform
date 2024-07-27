locals {
  vm_template_name = "debian-12.6.0-20240727"
  storage_name     = "local-zfs"

  load_balancer_nodes = [
    { node = "crimson", id = 3111, ip = "10.0.31.21", memory = 4096, cores = 1, size = 50 },
    { node = "emerald", id = 3112, ip = "10.0.31.22", memory = 4096, cores = 1, size = 50 },
  ]
}

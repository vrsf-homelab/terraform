locals {
  vm_template_name = "debian-12.6.0-20240731"
  storage_name     = "local-lvm"

  load_balancer_nodes = [
    { node = "alpha", id = 3111, ip = "10.0.31.11", memory = 4096, cores = 1, size = 50 },
    { node = "beta", id = 3112, ip = "10.0.31.12", memory = 2048, cores = 1, size = 50 },
    { node = "beta", id = 3113, ip = "10.0.31.13", memory = 2048, cores = 1, size = 50 },
  ]

  # dns_nodes = [
  #   # TODO: Move to 'tango'
  #   { node = "beta", id = 3150, ip = "10.0.31.30", memory = 2048, cores = 1, size = 100 },
  # ]

  home_assistant_nodes = [
    # TODO: Move to 'tango'
    { node = "beta", id = 3131, ip = "10.0.31.31", memory = 2048, cores = 1, size = 100 },
  ]

  # authentik_nodes = [
  #   # TODO: Move to 'tango'
  #   { node = "beta", id = 3132, ip = "10.0.31.32", memory = 2048, cores = 1, size = 100 },
  # ]
}

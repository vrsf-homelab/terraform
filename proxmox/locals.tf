locals {
  ssh_key = <<EOF
  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGzdJba7f4WcdeTdFX21ZX3NMAUCT+BWbRazr8GPjqWT pmg.farys@gmail.com
  EOF

  k8s_cluster = {
    master = {
      crimson = [
        { ip = "10.69.35.100", memory = 8192, cores = 2, size = 50 },
        { ip = "10.69.35.101", memory = 8192, cores = 2, size = 50 },
      ],
      emerald = [
        { ip = "10.69.35.102", memory = 8192, cores = 2, size = 50 },
      ],
    },
    worker = {
      crimson = [
        { ip = "10.69.35.150", memory = 4096, cores = 2, size = 50 },
        { ip = "10.69.35.151", memory = 4096, cores = 2, size = 50 },
      ],
      emerald = [
        { ip = "10.69.35.152", memory = 4096, cores = 1, size = 50 },
        { ip = "10.69.35.153", memory = 4096, cores = 1, size = 50 },
        { ip = "10.69.35.154", memory = 4096, cores = 1, size = 50 },
      ],
    }
  }

  k8s_cluster_master_map = flatten([
    for pve, nodes in local.k8s_cluster.master : flatten([
      for node in nodes : {
        "pve" : pve,
        "node" : node
      }
    ])
  ])

  k8s_cluster_worker_map = flatten([
    for pve, nodes in local.k8s_cluster.worker : flatten([
      for node in nodes : {
        "pve" : pve,
        "node" : node
      }
    ])
  ])
}

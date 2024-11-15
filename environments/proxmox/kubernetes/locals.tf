locals {
  vm_template_name = "debian-12.6.0-20240731"
  storage_name     = "local-lvm"

  k8s_cluster = {
    control_plane = {
      name_prefix = "k3s-server",
      tags        = ["k3s", "k3s_server"]
      vms = [
        { pve = "alpha", id = 3151, ip = "10.0.31.51", memory = 4096, cores = 1, size = 50 },
        { pve = "alpha", id = 3152, ip = "10.0.31.52", memory = 4096, cores = 1, size = 50 },
        { pve = "beta", id = 3153, ip = "10.0.31.53", memory = 4096, cores = 1, size = 50 }, # charlie on 3rd node
      ]
    },
    node = {
      name_prefix = "k3s-agent",
      tags        = ["k3s", "k3s_agent"],
      vms = [
        { pve = "alpha", id = 3170, ip = "10.0.31.70", memory = 8192, cores = 2, size = 50 },
        { pve = "alpha", id = 3171, ip = "10.0.31.71", memory = 8192, cores = 2, size = 50 },
        { pve = "beta", id = 3172, ip = "10.0.31.72", memory = 8192, cores = 2, size = 50 },
        { pve = "beta", id = 3173, ip = "10.0.31.73", memory = 4096, cores = 1, size = 50 }, # 8GB, 2CPU on 3rd node
      ]
    }
  }
}

locals {
  ssh_key = <<EOF
  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGzdJba7f4WcdeTdFX21ZX3NMAUCT+BWbRazr8GPjqWT pmg.farys@gmail.com
  EOF

  vm_template_name = "debian-12.6.0-20240727"
  storage_name     = "local-zfs"

  k8s_cluster = {
    master = [
      { node = "crimson", id = 3151, ip = "10.0.31.51", memory = 8192, cores = 2, size = 50 },
      { node = "emerald", id = 3152, ip = "10.0.31.52", memory = 8192, cores = 2, size = 50 },
      { node = "crimson", id = 3153, ip = "10.0.31.53", memory = 8192, cores = 2, size = 50 },
    ],
    worker = [
      # { ip = "10.0.31.70", memory = 4096, cores = 2, size = 50 },
      # { ip = "10.0.31.71", memory = 4096, cores = 2, size = 50 },
      # { ip = "10.0.31.72", memory = 8192, cores = 1, size = 50 },
      # { ip = "10.0.31.73", memory = 8192, cores = 1, size = 50 },
    ]
  }
}

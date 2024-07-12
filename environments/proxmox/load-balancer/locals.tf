locals {
  ssh_key = <<EOF
  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGzdJba7f4WcdeTdFX21ZX3NMAUCT+BWbRazr8GPjqWT pmg.farys@gmail.com
  EOF

  vm_nodes = {
    crimson = "10.69.30.20",
    emerald = "10.69.30.21"
  }

  vm_specs = {
    name_prefix = "lb"
    memory      = 1024,
    cores       = 1,
    size        = 5,
    tags        = ["load_balancer"]
  }
}

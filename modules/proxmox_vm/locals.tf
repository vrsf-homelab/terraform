locals {
  hostname = "${var.name}-ip-${replace(var.ip, ".", "-")}"
}

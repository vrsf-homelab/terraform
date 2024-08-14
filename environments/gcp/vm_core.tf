resource "google_service_account" "vm_core" {
  account_id   = "vm-core-sa"
  display_name = "VM Core SA"
}

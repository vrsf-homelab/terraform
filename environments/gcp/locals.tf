locals {
  vault = {
    service_account = "serviceAccount:${google_service_account.vm_core.email}"

    unseal_kms = {
      keyring = {
        name     = "vault-keyring"
        location = "europe-central2"
      },
      crypto_key = {
        name            = "vault-unseal"
        rotation_period = "15552000s" # 180 days
      }
    }
  }
}

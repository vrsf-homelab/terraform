# K M S  K E Y  R I N G
resource "google_kms_key_ring" "vault_kms" {
  project  = var.project_id
  name     = local.vault.unseal_kms.keyring.name
  location = local.vault.unseal_kms.keyring.location
}


# K M S  C R Y P T O  K E Y
resource "google_kms_crypto_key" "vault_kms" {
  key_ring        = google_kms_key_ring.vault_kms.id
  name            = local.vault.unseal_kms.crypto_key.name
  rotation_period = local.vault.unseal_kms.crypto_key.rotation_period
}


# K M S  I A M  M E M B E R
resource "google_kms_crypto_key_iam_member" "vault_kms_encrypter" {
  crypto_key_id = google_kms_crypto_key.vault_kms.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = local.vault.service_account
}

resource "google_kms_crypto_key_iam_member" "vault_kms_viewer" {
  crypto_key_id = google_kms_crypto_key.vault_kms.id
  role          = "roles/cloudkms.viewer"
  member        = local.vault.service_account
}

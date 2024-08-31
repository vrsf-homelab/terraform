resource "vault_policy" "snapshot_agent" {
  name   = "snapshot-agent"
  policy = data.vault_policy_document.snapshot_agent.hcl
}

data "vault_policy_document" "snapshot_agent" {
  rule {
    path         = "/sys/storage/raft/snapshot"
    capabilities = ["read"]
    description  = "Read-only access to make a Vault snapshot"
  }
}

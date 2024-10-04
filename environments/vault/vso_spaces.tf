module "vso-project" {
  for_each = local.projects

  source = "./modules/vso-space"

  name          = each.value.name
  namespace     = each.value.namespace
  kv_mount_path = vault_mount.secrets_kv2.path
}

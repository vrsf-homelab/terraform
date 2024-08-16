# resource "vault_identity_entity" "vertisan" {
#   name              = "Paweł"
#   external_policies = true
#   metadata = {
#     abc = "123"
#   }
# }

# resource "vault_identity_entity_policies" "vertisan" {
#   entity_id = vault_identity_entity.vertisan.id
#   policies  = [vault_policy.admin.name]
#   exclusive = true
# }

# resource "vault_identity_group_member_entity_ids" "vertisan" {
#   group_id          = vault_identity_group.admin.id
#   member_entity_ids = [vault_identity_entity.vertisan.id]
#   exclusive         = true
# }

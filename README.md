# VRS-Factory Homelab Terraform

## Proxmox role

Run on destination PVE node (or just on one if you have a cluster)

```shell
PVE_ROLE_NAME=Terraform
PVE_USERNAME=terraform
PVE_TOKEN_NAME=terraform

# Create role with a required permissions
pveum role add $PVE_ROLE_NAME -privs "Datastore.AllocateSpace Datastore.Audit Pool.Allocate Sys.Audit Sys.Console Sys.Modify VM.Allocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Migrate VM.Monitor VM.PowerMgmt SDN.Use"

# Create user
pveum user add $PVE_USERNAME@pve

# Assign created role for user
pveum aclmod / -user $PVE_USERNAME@pve -role $PVE_ROLE_NAME

# Create a token for user
pveum user token add $PVE_USERNAME@pve $PVE_TOKEN_NAME --privsep 0
```

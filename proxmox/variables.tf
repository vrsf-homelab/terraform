#### AWS State Backend ####
variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}


#### Proxmox Provider ####
variable "proxmox_api_token_id" {
  type = string
}

variable "proxmox_api_token_secret" {
  type = string
}

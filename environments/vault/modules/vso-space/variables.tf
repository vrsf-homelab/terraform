variable "name" {
  type        = string
  description = "Name of the project."
}

variable "namespace" {
  type        = string
  description = "Namepspace of the project."
}

variable "kv_mount_path" {
  type        = string
  description = "KV mount path."
}

variable "secrets_path" {
  type        = string
  description = "KV path with spaces for K8s."
  default     = "kubernetes"
}

variable "project_id" {
  type        = string
  description = "Project ID."
}

variable "region" {
  type        = string
  description = "Main region of the provider."
  default     = "europe-central2"
}

variable "credentials_path" {
  type        = string
  description = "Path to the JSON file with a GCP credentials."
}

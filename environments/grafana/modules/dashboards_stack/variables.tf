variable "name" {
  type = string
}

variable "uid" {
  type    = string
  default = ""
}

variable "dashboards" {
  type = list(string)
}

variable "with_folder" {
  type    = bool
  default = true
}

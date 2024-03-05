variable "name" {
  type = string
}

variable "s3_bucket_arn" {
  type    = string
  default = null
}

variable "ddb_table_arn" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

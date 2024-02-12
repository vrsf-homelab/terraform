## AWS credentials required for backend
variable "aws_access_key" {
  type = string
}
variable "aws_secret_key" {
  type = string
}
variable "aws_region" {
  type    = string
  default = "eu-central-1"
}
## /end

variable "api_token" {
  type = string
}

variable "account_id" {
  type = string
}

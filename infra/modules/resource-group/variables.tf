variable "location" {
  type    = string
  default = "westeurope"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "name" {
  type = string
}

variable "prefix" {
  type    = string
  default = "001"
}

variable "tags" {
  type    = map(any)
  default = {}
}

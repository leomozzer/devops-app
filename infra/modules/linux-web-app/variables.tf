variable "location" {
  type    = string
  default = "eastus"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "app_name" {
  type = string
}

variable "prefix" {
  type    = string
  default = "001"
}

variable "tags" {
  type = map(any)
  default = {
    "ResourceType" = "App Service"
  }
}

variable "app_service_sku_name" {
  type    = string
  default = "B1"
}

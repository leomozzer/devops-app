variable "location" {
  type    = string
  default = "westeurope"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "resource_group_name" {
  type    = string
  default = ""
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

variable "log_analytics_workspace_id" {
  type    = string
  default = ""
}

variable "enable_diagnostic_setting_app_service_plan" {
  type    = bool
  default = true
}

variable "enable_diagnostic_setting_web_app" {
  type    = bool
  default = true
}

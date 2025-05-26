#######################
#    Commom locals    #
#######################
locals {
  region_name_standardize = {
    "East US"           = "eus"
    "eastus"            = "eus"
    "east us"           = "eus"
    "eastus2"           = "eus2"
    "east us2"          = "eus2"
    "West US"           = "wus"
    "North Central US"  = "ncus"
    "South Central US"  = "scus"
    "East US 2"         = "eus2"
    "West US 2"         = "wus2"
    "Central US"        = "cus"
    "West Central US"   = "wcus"
    "Canada East"       = "canadaeast"
    "Canada Central"    = "canadacentral"
    "West Europe"       = "weu"
    "westeurope"        = "weu"
    "west europe"       = "weu"
    "North Europe"      = "neu"
    "northeurope"       = "neu"
    "UK South"          = "uks"
    "UK West"           = "ukw"
    "France Central"    = "francecentral"
    "France South"      = "francesouth"
    "Germany North"     = "germanynorth"
    "Germany West"      = "germanywest"
    "Switzerland North" = "swnorth"
    "Switzerland West"  = "swwest"
    "Norway East"       = "noeast"
    "Norway West"       = "nowest"
    # Add more mappings as needed
  }
}

locals {
  resource_group_name   = "rg-asp-${var.app_name}-${var.environment}-${local.region_name_standardize[var.location]}-${var.prefix}"
  app_service_plan_name = "asp-${var.app_name}-${var.environment}-${local.region_name_standardize[var.location]}-${var.prefix}"
  web_app_name          = "asp-${var.app_name}-${var.environment}-${local.region_name_standardize[var.location]}-${var.prefix}"
}

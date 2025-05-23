resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_service_plan" "service_plan" {
  name                = local.app_service_plan_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = var.app_service_sku_name
}

resource "azurerm_linux_web_app" "web_app" {
  name                = local.web_app_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.service_plan.location
  service_plan_id     = azurerm_service_plan.service_plan.id

  site_config {
    application_stack {
      node_version = "20-lts"
    }
  }
}

resource "azurerm_resource_group" "rg" {
  count    = length(var.resource_group_name) == 0 ? 1 : 0
  name     = local.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_service_plan" "service_plan" {
  name                = local.app_service_plan_name
  resource_group_name = length(var.resource_group_name) > 0 ? var.resource_group_name : azurerm_resource_group.rg[0].name
  location            = length(var.resource_group_name) > 0 ? var.location : azurerm_resource_group.rg[0].location
  os_type             = "Linux"
  sku_name            = var.app_service_sku_name
}

resource "azurerm_linux_web_app" "web_app" {
  name                = local.web_app_name
  resource_group_name = length(var.resource_group_name) > 0 ? var.resource_group_name : azurerm_resource_group.rg[0].name
  location            = azurerm_service_plan.service_plan.location
  service_plan_id     = azurerm_service_plan.service_plan.id

  site_config {
    application_stack {
      node_version = var.node_version
    }
    app_command_line = var.app_command_line
  }
}

resource "azurerm_monitor_diagnostic_setting" "asp_diagnostic_setting" {
  count                      = var.enable_diagnostic_setting_app_service_plan == true ? length(var.log_analytics_workspace_id) > 0 ? 1 : 0 : 0
  name                       = "diagnosticSetting"
  target_resource_id         = azurerm_service_plan.service_plan.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  metric {
    category = "AllMetrics"
  }
}

resource "azurerm_monitor_diagnostic_setting" "app_diagnostic_setting" {
  count                      = var.enable_diagnostic_setting_web_app == true ? length(var.log_analytics_workspace_id) > 0 ? 1 : 0 : 0
  name                       = "diagnosticSetting"
  target_resource_id         = azurerm_linux_web_app.web_app.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  metric {
    category = "AllMetrics"
  }
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "service_plan_name" {
  value = azurerm_service_plan.service_plan.name
}

output "web_app_name" {
  value = azurerm_linux_web_app.web_app.name
}

output "resource_group_name" {
  value = length(var.resource_group_name) > 0 ? var.resource_group_name : azurerm_resource_group.rg[0].name
}

output "service_plan_name" {
  value = azurerm_service_plan.service_plan.name
}

output "web_app_name" {
  value = azurerm_linux_web_app.web_app.name
}

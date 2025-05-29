module "resource_group" {
  source = "../../modules/resource-group"
  name   = "backend"
  #prefix = "002"
}

module "backend_app_service" {
  source              = "../../modules/linux-web-app"
  app_name            = "backend"
  resource_group_name = module.resource_group.output.name
  #prefix              = "002"
}

output "app_service" {
  value = module.backend_app_service
}

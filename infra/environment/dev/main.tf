module "backend_app_service" {
  source   = "../../modules/linux-web-app"
  app_name = "backend"
}

output "app_service" {
  value = module.backend_app_service
}

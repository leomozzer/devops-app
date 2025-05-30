provider "azurerm" {
  subscription_id                 = var.subscription_id
  resource_provider_registrations = "none"
  features {

  }
}

variables {
  app_name    = "test"
  environment = var.environment
}


run "setup" {
  module {
    source = "../../modules/linux-web-app"
  }
}

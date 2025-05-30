provider "azurerm" {
  subscription_id                 = var.subscription_id
  resource_provider_registrations = "none"
  features {

  }
}

variables {
  name        = "test"
  environment = var.environment
}

run "setup" {
  module {
    source = "../../modules/resource-group"
  }

  assert {
    condition     = azurerm_resource_group.rg.name == "rg-test-${var.environment}-weu-001"
    error_message = "Resource group name didn't matched with the conditions"
  }
}

terraform {
  required_version        = ">= 0.13"
  backend "azurerm" {
  }
}

provider "azurerm" {
  version                = "2.35.0"
  
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

  features {
  }
}

#output "testing_output" {
#  value = data.azurerm_user_assigned_identity.managed_identity_aad.id
#}

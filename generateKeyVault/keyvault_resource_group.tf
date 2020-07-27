resource "azurerm_resource_group" "keyvault_rg" {
  name     = var.keyvaultrg
  location = var.region
  tags = {
    environment = var.environment
  }
}
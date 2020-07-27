resource "azurerm_resource_group" "vnet" {
  name     = "${var.project}-${var.environment}-rg-vnet"
  location = var.region
  tags     = {
    environment = var.environment
  }
}


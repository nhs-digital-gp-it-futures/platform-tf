resource "azurerm_resource_group" "vnet" {
  name          = "${var.project}-${var.environment}-rg-vnet"
  location      = var.region
  tags = {
    environment = var.environment
  }
}

resource "azurerm_resource_group" "aks" {
  name          = "${var.project}-${var.environment}-rg-aks"
  location      = var.region
  tags = {
    environment = var.environment
  }
}

resource "azurerm_resource_group" "appgw" {
  name          = "${var.project}-${var.environment}-rg-appgw"
  location      = var.region
  tags = {
    environment = var.environment
  }
}



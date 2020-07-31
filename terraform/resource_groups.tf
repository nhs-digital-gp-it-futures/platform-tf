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

resource "azurerm_resource_group" "storage" {
  name          = "${var.project}-${var.environment}-rg-sa"
  location      = var.region
  tags = {
    environment = var.environment
  }
}
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

resource "azurerm_resource_group" "storage" {
  name          = "${var.project}-${var.environment}-rg-sa"
  location      = var.region
  tags = {
    environment = var.environment
  }
}

resource "azurerm_resource_group" "sql-pri" {
  name     = "${var.project}-${var.environment}-rg-sql-pri"
  location = var.region
  tags = {
    environment = var.environment
  }
}

resource "azurerm_resource_group" "sql-sec" {
  count         = local.shortenv == "testing" || local.shortenv == "production" ? 1 : 0 

  name          = "${var.project}-${var.environment}-rg-sql-sec"
  location      = local.sql_region2
  tags = {
    environment = var.environment
  }
}

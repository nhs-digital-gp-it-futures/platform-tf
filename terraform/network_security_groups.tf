resource "azurerm_network_security_group" "gateway" {
  name                = "${var.project}-${var.environment}-nsg-gateway"
  location            = var.region
  resource_group_name = azurerm_resource_group.appgw.name

  tags = {
    environment       = var.environment
  }
}

resource "azurerm_network_security_group" "aks" {
  name                = "${var.project}-${var.environment}-nsg-aks"
  location            = var.region
  resource_group_name = azurerm_resource_group.aks.name

  tags = {
    environment       = var.environment
  }
}

resource "azurerm_subnet" "gateway" {
  name                 = "${var.project}-${var.environment}-gateway"
  resource_group_name  = azurerm_resource_group.vnet.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${data.azurerm_key_vault_secret.addrprefix.value}.0.0/28"]
}

resource "azurerm_subnet" "aks" {
  name                 = "${var.project}-${var.environment}-aks"
  resource_group_name  = azurerm_resource_group.vnet.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${data.azurerm_key_vault_secret.addrprefix.value}.64.0/20"]

  service_endpoints    = ["Microsoft.Sql"]
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.project}-${var.environment}-vnet"
  location            = var.region
  address_space       = [data.azurerm_key_vault_secret.vnetaddsp.value]
  resource_group_name = azurerm_resource_group.vnet.name
  tags = {
    environment = var.environment
  }
}
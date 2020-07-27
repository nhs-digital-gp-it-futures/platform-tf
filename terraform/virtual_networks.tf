locals{
    ip_addsp = "192.168.0.0/24"
}

/*resource "azurerm_virtual_network" "vnet" {
  name                = "${var.project}-${var.environment}-vnet"
  location            = var.region
  address_space       = [local.ip_addsp]
  resource_group_name = azurerm_resource_group.vnet.name
  tags = {
    environment = var.environment
  }
}*/
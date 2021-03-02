resource "azurerm_virtual_network" "vnet" {
  name                = "${var.project}-${var.environment}-vnet"
  location            = var.region
  address_space       = ["${var.addrprefix}.0.0/17"] # # Note: x.x.128.0/17 will be used for Kubernetes Service Range
  resource_group_name = azurerm_resource_group.vnet.name
  tags = {
    environment = var.environment
  }
}

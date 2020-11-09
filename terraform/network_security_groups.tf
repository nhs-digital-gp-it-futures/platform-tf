resource "azurerm_network_security_group" "gateway" {
  name                = "${var.project}-${var.environment}-nsg-gateway"
  location            = var.region
  resource_group_name = azurerm_resource_group.appgw.name

  tags = {
    environment       = var.environment
  }
}

# resource "azurerm_network_security_group" "gateway_pri" {
#   count               = local.shortenv == "test" || local.shortenv == "prod" ? 1 : 0 

#   name                = "${var.project}-${var.environment}-nsg-gateway-pri"
#   location            = var.region
#   resource_group_name = azurerm_resource_group.appgw.name

#   tags = {
#     environment       = var.environment
#   }
# }

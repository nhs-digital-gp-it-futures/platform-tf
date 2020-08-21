resource "azurerm_subnet_network_security_group_association" "gateway" {
  subnet_id                 = azurerm_subnet.gateway.id
  network_security_group_id = azurerm_network_security_group.gateway.id
 }

# resource "azurerm_subnet_network_security_group_association" "gateway_pri" {
#   count                     = local.shortenv == "test" || local.shortenv == "prod" ? 1 : 0 

#   subnet_id                 = azurerm_subnet.gateway_pri.id
#   network_security_group_id = azurerm_network_security_group.gateway_pri.id
# }
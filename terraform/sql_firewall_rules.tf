#SQL Firewall rule to allow internal Azure Services to connect to DB
resource "azurerm_sql_firewall_rule" "sql-pri" {
  name                = "azure_services"
  resource_group_name = azurerm_resource_group.sql-pri.name
  server_name         = azurerm_sql_server.sql-pri.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

# SQL Firewall rule to allow subnet access from aks network
resource "azurerm_sql_virtual_network_rule" "sql-pri-net" {
  name                = "${var.project}-${var.environment}-sql-subnet-rule"
  resource_group_name = azurerm_resource_group.sql-pri.name
  server_name         = azurerm_sql_server.sql-pri.name
  subnet_id           = azurerm_subnet.aks.id
}

resource "azurerm_sql_firewall_rule" "sql-sec" {
  count               = local.shortenv == "test" || local.shortenv == "prod" ? 1 : 0 

  name                = "azure_services"
  resource_group_name = azurerm_resource_group.sql-sec[0].name
  server_name         = azurerm_sql_server.sql-sec-live[0].name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
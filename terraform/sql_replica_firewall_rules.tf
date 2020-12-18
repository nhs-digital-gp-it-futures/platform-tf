#SQL Firewall rule to allow internal Azure Services to connect to DB
resource "azurerm_sql_firewall_rule" "sql_azure_services_sec" {
  count               = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 

  name                = "azure_services"
  resource_group_name = azurerm_resource_group.sql-sec[0].name
  server_name         = azurerm_sql_server.sql-sec[0].name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_sql_firewall_rule" "sql_bjss_vpn_sec" {
  count               = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 

  name                = "AllowBjssVpn"
  resource_group_name = azurerm_resource_group.sql-sec[0].name
  server_name         = azurerm_sql_server.sql-sec[0].name
  start_ip_address    = data.azurerm_key_vault_secret.bjssvpn.value
  end_ip_address      = data.azurerm_key_vault_secret.bjssvpn.value
}


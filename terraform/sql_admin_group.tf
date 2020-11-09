resource "azurerm_sql_active_directory_administrator" "bc-sql-pri" {
  server_name         = azurerm_sql_server.sql-pri.name
  resource_group_name = azurerm_resource_group.sql-pri.name
  login               = data.azurerm_key_vault_secret.sqladmins.value
  tenant_id           = var.tenant_id
  object_id           = data.azurerm_key_vault_secret.sqladmins.value 
  }

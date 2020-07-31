resource "azurerm_sql_failover_group" "sql-bapi-pri" {
  count               = local.shortenv == "test" || local.shortenv == "prod" ? 1 : 0 

  name                = "${var.project}-${var.environment}-sql-fog"
  resource_group_name = azurerm_resource_group.sql-pri.name
  server_name         = azurerm_sql_server.sql-pri.name
  databases           = [azurerm_sql_database.sql-bapi-pri-live[0].id]
  partner_servers {
    id = azurerm_sql_server.sql-sec-live[0].id
  }
  read_write_endpoint_failover_policy {
    mode          = "Automatic"
    grace_minutes = 30
  }
}
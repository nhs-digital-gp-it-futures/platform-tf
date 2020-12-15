resource "azurerm_sql_failover_group" "sql-bapi-pri" {
  count               = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 

  name                = "${var.project}-${var.environment}-sql-fog-bapi-pri"
  resource_group_name = azurerm_resource_group.sql-pri.name
  server_name         = azurerm_sql_server.sql-pri.name
  databases           = [azurerm_sql_database.sql-bapi-pri[0].id]
  
  partner_servers {
    id = azurerm_sql_server.sql-sec[0].id
  }
  
  read_write_endpoint_failover_policy {
    mode          = "Automatic"
    grace_minutes = 30
  }

  depends_on = [
    azurerm_sql_database.sql-bapi-pri-sec[0]
  ]
}

resource "azurerm_sql_failover_group" "sql-bapi-pub" {
  count               = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 

  name                = "${var.project}-${var.environment}-sql-fog-bapi-pub"
  resource_group_name = azurerm_resource_group.sql-pri.name
  server_name         = azurerm_sql_server.sql-pri.name
  databases           = [azurerm_sql_database.sql-bapi-pub[0].id]
  
  partner_servers {
    id = azurerm_sql_server.sql-sec[0].id
  }
  
  read_write_endpoint_failover_policy {
    mode          = "Automatic"
    grace_minutes = 30
  }

  depends_on = [
    azurerm_sql_database.sql-bapi-pub-sec[0]
  ]
}

resource "azurerm_sql_failover_group" "sql-isapi-pub" {
  count               = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 

  name                = "${var.project}-${var.environment}-sql-fog-isapi-pub"
  resource_group_name = azurerm_resource_group.sql-pri.name
  server_name         = azurerm_sql_server.sql-pri.name
  databases           = [azurerm_sql_database.sql-isapi-pub[0].id]
  
  partner_servers {
    id = azurerm_sql_server.sql-sec[0].id
  }
  
  read_write_endpoint_failover_policy {
    mode          = "Automatic"
    grace_minutes = 30
  }

  depends_on = [
    azurerm_sql_database.sql-isapi-pub-sec[0]
  ]
}

resource "azurerm_sql_failover_group" "sql-ordapi-pub" {
  count               = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 

  name                = "${var.project}-${var.environment}-sql-fog-ordapi-pub"
  resource_group_name = azurerm_resource_group.sql-pri.name
  server_name         = azurerm_sql_server.sql-pri.name
  databases           = [azurerm_sql_database.sql-ordapi-pub[0].id]
  
  partner_servers {
    id = azurerm_sql_server.sql-sec[0].id
  }
  
  read_write_endpoint_failover_policy {
    mode          = "Automatic"
    grace_minutes = 30
  }

  depends_on = [
    azurerm_sql_database.sql-ordapi-pub-sec[0]
  ]
}

data "azurerm_sql_server" "sql_replica_server" {
  name                = var.sqlsvr_replica_name
  resource_group_name = var.rg_replica_name
}

resource "azurerm_sql_failover_group" "sql_bapi_pri_fog" {
  name                = "${var.project}-${var.environment}-sql-fog-bapi-pri"
  resource_group_name = var.rg_name
  server_name         = var.sqlsvr_name
  databases           = [azurerm_sql_database.sql_bapi_pri.id]
  
  partner_servers {
    id = data.azurerm_sql_server.sql_replica_server.id
  }
  
  read_write_endpoint_failover_policy {
    mode          = "Automatic"
    grace_minutes = 30
  }

  depends_on = [
    azurerm_sql_database.sql_bapi_pri_rep
  ]
}

resource "azurerm_sql_failover_group" "sql_bapi_pub_fog" {
  name                = "${var.project}-${var.environment}-sql-fog-bapi-pub"
  resource_group_name = var.rg_name
  server_name         = var.sqlsvr_name
  databases           = [azurerm_sql_database.sql_bapi_pub.id]
  
  partner_servers {
    id = data.azurerm_sql_server.sql_replica_server.id
  }
  
  read_write_endpoint_failover_policy {
    mode          = "Automatic"
    grace_minutes = 30
  }

  depends_on = [
    azurerm_sql_database.sql_bapi_pub_rep
  ]
}

resource "azurerm_sql_failover_group" "sql_isapi_pub_fog" {
  name                = "${var.project}-${var.environment}-sql-fog-isapi-pub"
  resource_group_name = var.rg_name
  server_name         = var.sqlsvr_name
  databases           = [azurerm_sql_database.sql_isapi_pub.id]
  
  partner_servers {
    id = data.azurerm_sql_server.sql_replica_server.id
  }
  
  read_write_endpoint_failover_policy {
    mode          = "Automatic"
    grace_minutes = 30
  }

  depends_on = [
    azurerm_sql_database.sql_isapi_pub_rep
  ]
}

resource "azurerm_sql_failover_group" "sql_ordapi_pub_fog" {
  name                = "${var.project}-${var.environment}-sql-fog-ordapi-pub"
  resource_group_name = var.rg_name
  server_name         = var.sqlsvr_name
  databases           = [azurerm_sql_database.sql_ordapi_pub.id]
  
  partner_servers {
    id = data.azurerm_sql_server.sql_replica_server.id
  }
  
  read_write_endpoint_failover_policy {
    mode          = "Automatic"
    grace_minutes = 30
  }

  depends_on = [
    azurerm_sql_database.sql_ordapi_pub_rep
  ]
}
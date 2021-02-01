resource "azurerm_sql_database" "sql_bapi_pri_rep" {
  name                = "${var.db_name}-private-bapi"
  resource_group_name = var.rg_replica_name
  location            = var.region_replica
  server_name         = var.sqlsvr_replica_name
  create_mode         = "OnlineSecondary"
  source_database_id  = azurerm_sql_database.sql_bapi_pri.id
  
  tags = {
    environment                    = var.environment
  }
}

resource "azurerm_sql_database" "sql_bapi_pub_rep" {
  name                = "${var.db_name}-public-bapi"
  resource_group_name = var.rg_replica_name
  location            = var.region_replica
  server_name         = var.sqlsvr_replica_name
  create_mode         = "OnlineSecondary"
  source_database_id  = azurerm_sql_database.sql_bapi_pub.id
  
  tags = {
    environment                    = var.environment
  }
}

resource "azurerm_sql_database" "sql_isapi_pub_rep" {
  name                = "${var.db_name}-public-isapi"
  resource_group_name = var.rg_replica_name
  location            = var.region_replica
  server_name         = var.sqlsvr_replica_name
  create_mode         = "OnlineSecondary"
  source_database_id  = azurerm_sql_database.sql_isapi_pub.id
  
  tags = {
    environment                    = var.environment
  }
}

resource "azurerm_sql_database" "sql_ordapi_pub_rep" {
  name                = "${var.db_name}-public-isapi"
  resource_group_name = var.rg_replica_name
  location            = var.region_replica
  server_name         = var.sqlsvr_replica_name
  create_mode         = "OnlineSecondary"
  source_database_id  = azurerm_sql_database.sql_ordapi_pub.id
  
  tags = {
    environment                    = var.environment
  }
}

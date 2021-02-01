resource "azurerm_sql_database" "sql_bapi_pri" {
  #count                            = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 
  name                             = "${var.db_name}-private-bapi" # "${local.sql_pridbname}-bapi"
  resource_group_name              = var.rg_name # azurerm_resource_group.sql-pri.name
  location                         = var.region
  server_name                      = var.sqlsvr_name # azurerm_sql_server.sql-pri.name
  collation                        = var.sql_collation
  edition                          = var.sql_edition
  requested_service_objective_name = var.sql_size

  tags = {
    environment                    = var.environment
  }
}

resource "azurerm_sql_database" "sql_bapi_pub" {
  name                             = "${var.db_name}-public-bapi" 
  resource_group_name              = var.rg_name 
  location                         = var.region
  server_name                      = var.sqlsvr_name
  collation                        = var.sql_collation
  edition                          = var.sql_edition
  requested_service_objective_name = var.sql_size

  tags = {
    environment                    = var.environment
  }
}

resource "azurerm_sql_database" "sql_isapi_pub" {
  name                             = "${var.db_name}-public-isapi" 
  resource_group_name              = var.rg_name 
  location                         = var.region
  server_name                      = var.sqlsvr_name
  collation                        = var.sql_collation
  edition                          = var.sql_edition
  requested_service_objective_name = var.sql_size

  tags = {
    environment                    = var.environment
  }
}

resource "azurerm_sql_database" "sql_ordapi_pub" {
  name                             = "${var.db_name}-public-ordapi" 
  resource_group_name              = var.rg_name 
  location                         = var.region
  server_name                      = var.sqlsvr_name
  collation                        = var.sql_collation
  edition                          = var.sql_edition
  requested_service_objective_name = var.sql_size

  tags = {
    environment                    = var.environment
  }
}

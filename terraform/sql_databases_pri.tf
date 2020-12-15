resource "azurerm_sql_database" "sql-bapi-pri" {
  count                            = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 
  name                             = "${local.sql_pridbname}-bapi"
  resource_group_name              = azurerm_resource_group.sql-pri.name
  location                         = var.region
  server_name                      = azurerm_sql_server.sql-pri.name
  collation                        = local.sql_collation
  edition                          = local.sql_edition
  requested_service_objective_name = local.sql_size

  tags = {
    environment                    = var.environment
  }
}

resource "azurerm_sql_database" "sql-bapi-pub" {
  count                            = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 
  name                             = "${local.sql_pubdbname}-bapi"
  resource_group_name              = azurerm_resource_group.sql-pri.name
  location                         = var.region
  server_name                      = azurerm_sql_server.sql-pri.name
  collation                        = local.sql_collation
  edition                          = local.sql_edition
  requested_service_objective_name = local.sql_size

  tags = {
    environment                    = var.environment
  }
}

resource "azurerm_sql_database" "sql-isapi-pub" {
  count                            = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 
  name                             = "${local.sql_pubdbname}-isapi"
  resource_group_name              = azurerm_resource_group.sql-pri.name
  location                         = var.region
  server_name                      = azurerm_sql_server.sql-pri.name
  collation                        = local.sql_collation
  edition                          = local.sql_edition
  requested_service_objective_name = local.sql_size

  tags = {
    environment                    = var.environment
  }
}

resource "azurerm_sql_database" "sql-ordapi-pub" {
  count                            = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 
  name                             = "${local.sql_pubdbname}-ordapi"
  resource_group_name              = azurerm_resource_group.sql-pri.name
  location                         = var.region
  server_name                      = azurerm_sql_server.sql-pri.name
  collation                        = local.sql_collation
  edition                          = local.sql_edition
  requested_service_objective_name = local.sql_size

  tags = {
    environment                    = var.environment
  }
}
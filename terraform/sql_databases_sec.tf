resource "azurerm_sql_database" "sql-bapi-pri-sec" {
  count                            = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 
  name                             = "${local.sql_pridbname}-bapi"
  resource_group_name              = azurerm_resource_group.sql-sec[0].name
  location                         = local.sql_region2
  server_name                      = azurerm_sql_server.sql-sec[0].name
  # collation                        = local.sql_collation
  # edition                          = local.sql_edition
  # requested_service_objective_name = local.sql_size

  create_mode                      = "OnlineSecondary"
  #creation_source_database_id     
  source_database_id               = azurerm_sql_database.sql-bapi-pri[0].id

  tags = {
    environment                    = var.environment
  }
}

resource "azurerm_sql_database" "sql-bapi-pub-sec" {
  count                            = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 
  name                             = "${local.sql_pubdbname}-bapi"
  resource_group_name              = azurerm_resource_group.sql-sec[0].name
  location                         = local.sql_region2
  server_name                      = azurerm_sql_server.sql-sec[0].name
  # collation                        = local.sql_collation
  # edition                          = local.sql_edition
  # requested_service_objective_name = local.sql_size

  create_mode                      = "OnlineSecondary"
  #creation_source_database_id      = 
  source_database_id               = azurerm_sql_database.sql-bapi-pub[0].id

  tags = {
    environment                    = var.environment
  }
}

resource "azurerm_sql_database" "sql-isapi-pub-sec" {
  count                            = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 
  name                             = "${local.sql_pubdbname}-isapi"
  resource_group_name              = azurerm_resource_group.sql-sec[0].name
  location                         = local.sql_region2
  server_name                      = azurerm_sql_server.sql-sec[0].name
  # collation                        = local.sql_collation
  # edition                          = local.sql_edition
  # requested_service_objective_name = local.sql_size

  create_mode                      = "OnlineSecondary"
  #creation_source_database_id      
  source_database_id               = azurerm_sql_database.sql-isapi-pub[0].id

  tags = {
    environment                    = var.environment
  }
}

resource "azurerm_sql_database" "sql-ordapi-pub-sec" {
  count                            = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 
  name                             = "${local.sql_pubdbname}-ordapi"
  resource_group_name              = azurerm_resource_group.sql-sec[0].name
  location                         = local.sql_region2
  server_name                      = azurerm_sql_server.sql-sec[0].name
  # collation                        = local.sql_collation
  # edition                          = local.sql_edition
  # requested_service_objective_name = local.sql_size

  create_mode                      = "OnlineSecondary"
  #creation_source_database_id      
  source_database_id               = azurerm_sql_database.sql-ordapi-pub[0].id

  tags = {
    environment                    = var.environment
  }
}

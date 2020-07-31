#SQL Database using for the BuyingCatalogueService Private
resource "azurerm_sql_database" "sql-bapi-pri-live" {
  count                            = local.shortenv == "test" || local.shortenv == "prod" ? 1 : 0 
  #bc-buyingcatalogue-private-bapi
  name                             = "${var.project}-${var.environment}-db-bapi-private"
  resource_group_name              = azurerm_resource_group.sql-pri.name
  location                         = var.region
  server_name                      = azurerm_sql_server.sql-pri.name
  collation                        = local.sql_collation
  edition                          = "Standard"
  requested_service_objective_name = "S1"

  tags = {
    environment                    = var.environment
  }
}
# resource "azurerm_sql_database" "sql-bapi-pri-dev" {
#   count                            = local.shortenv != "test" && local.shortenv != "prod" ? 1 : 0 

# #  name                             = "${var.project}-${var.environment}-db-bapi-private"
#   name                             = "xbc-${var.environment}-db-bapi"
#   resource_group_name              = azurerm_resource_group.sql-pri.name
#   location                         = var.region
#   server_name                      = azurerm_sql_server.sql-pri.name
#   collation                        = local.sql_collation
#   edition                          = local.sql_edition
#   requested_service_objective_name = local.sql_size

#   tags = {
#     environment                    = var.environment
#   }
# }

# resource "azurerm_sql_database" "sql-bapi-pub-live" {
#   count                            = local.shortenv == "test" && local.shortenv == "prod" ? 1 : 0 

#   name                             = "${var.project}-${var.environment}-db-bapi-public"
  
#   resource_group_name              = azurerm_resource_group.sql-pri.name
#   location                         = var.region
#   server_name                      = azurerm_sql_server.sql-pri.name
#   collation                        = local.sql_collation
#   edition                          = local.sql_edition
#   requested_service_objective_name = local.sql_size

#   tags = {
#     environment                    = var.environment
#   }
# }

# resource "azurerm_sql_database" "sql-isapi-dev" {
#   count                            = local.shortenv != "test" && local.shortenv != "prod" ? 1 : 0 

#   #name                             = "${var.project}-${var.environment}-db-isapi"
#   name                             = "xbc-${var.environment}-db-isapi"
#   resource_group_name              = azurerm_resource_group.sql-pri.name
#   location                         = var.region
#   server_name                      = azurerm_sql_server.sql-pri.name
#   collation                        = local.sql_collation
#   edition                          = local.sql_edition
#   requested_service_objective_name = local.sql_size

#   tags = {
#     environment                    = var.environment
#   }
# }

# resource "azurerm_sql_database" "sql-ordapi-dev" {
#   count                            = local.shortenv != "test" && local.shortenv != "prod" ? 1 : 0 

#   #name                             = "${var.project}-${var.environment}-db-ordapi"
#   name                             = "xbc-${var.environment}-db-ordapi"
#   resource_group_name              = azurerm_resource_group.sql-pri.name
#   location                         = var.region
#   server_name                      = azurerm_sql_server.sql-pri.name
#   collation                        = local.sql_collation
#   edition                          = local.sql_edition
#   requested_service_objective_name = local.sql_size

#   tags = {
#     environment                    = var.environment
#   }
# }
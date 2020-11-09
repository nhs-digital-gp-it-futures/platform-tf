# resource "azurerm_storage_account" "data_pri" {
#   count                     = local.shortenv == "test" || local.shortenv == "prod" ? 1 : 0 

#   name                      = "${var.project}${local.shortenv}pri"
#   location                  = var.region
#   resource_group_name       = azurerm_resource_group.storage.name
#   account_tier              = "Standard"
#   account_replication_type  = "grs"
#   account_kind              = "StorageV2"
#   enable_https_traffic_only = "true"
#   tags                      = {
#     environment             = var.environment
#   }
# }

# resource "azurerm_advanced_threat_protection" "data_pri" {
#   count              = local.shortenv == "test" || local.shortenv == "prod" ? 1 : 0 

#   target_resource_id = azurerm_storage_account.data_pri[0].id
#   enabled            = true
# }

# resource "azurerm_storage_container" "documents_pri" {
#   count                 = local.shortenv == "test" || local.shortenv == "prod" ? 1 : 0 
  
#   name                  = "documents"
#   storage_account_name  = azurerm_storage_account.data_pri[0].name
#   container_access_type = "blob"
# }
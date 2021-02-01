resource "azurerm_storage_account" "storage_account" {
#  count                     = local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 0 

  name                      = var.storage_account_name
  location                  = var.region
  resource_group_name       = var.rg_name
  account_tier              = "Standard"
  account_replication_type  = var.replication_type
  account_kind              = "StorageV2"
  enable_https_traffic_only = "true"
  allow_blob_public_access  = "true"
  tags                      = {
    environment             = var.environment
  }
}

# resource "azurerm_storage_account" "data_pri" {
#   count                     = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 

#   name                      = "${var.project}${local.shortenv}pri"
#   location                  = var.region
#   resource_group_name       = azurerm_resource_group.storage.name
#   account_tier              = "Standard"
#   account_replication_type  = "grs"
#   account_kind              = "StorageV2"
#   enable_https_traffic_only = "true"
#   allow_blob_public_access  = "true"
#   tags                      = {
#     environment             = var.environment
#   }
# }

# resource "azurerm_storage_account" "data_pub" {
#   count                     = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 

#   name                      = "${var.project}${local.shortenv}pub"
#   location                  = var.region
#   resource_group_name       = azurerm_resource_group.storage.name
#   account_tier              = "Standard"
#   account_replication_type  = "grs"
#   account_kind              = "StorageV2"
#   enable_https_traffic_only = "true"
#   allow_blob_public_access  = "true"
#   tags                      = {
#     environment             = var.environment
#   }
# }

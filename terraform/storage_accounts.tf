resource "azurerm_storage_account" "data_gen" {
  #count                     = local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 0 
  count                     = local.shortenv != "" ? 1 : 0 ### REMOVEME

  name                      = "${var.project}${local.shortenv}"
  location                  = var.region
  resource_group_name       = azurerm_resource_group.storage.name
  account_tier              = "Standard"
  account_replication_type  = "grs"
  account_kind              = "StorageV2"
  enable_https_traffic_only = "true"
  allow_blob_public_access  = "true"
  tags                      = {
    environment             = var.environment
  }
}

resource "azurerm_storage_container" "documents_gen" {
  #count                 = local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 0 
  count                 = local.shortenv != "" ? 1 : 0 ### REMOVEME

  name                  = "${var.environment}-documents"
  storage_account_name  = azurerm_storage_account.data_gen[0].name
  container_access_type = "blob"
}

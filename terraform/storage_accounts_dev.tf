resource "azurerm_storage_account" "data_gen" {
  count                     = local.shortenv != "test" && local.shortenv != "prod" ? 1 : 0 

  name                      = "${var.project}${local.shortenv}"
  location                  = var.region
  resource_group_name       = azurerm_resource_group.storage.name
  account_tier              = "Standard"
  account_replication_type  = "grs"
  account_kind              = "StorageV2"
  enable_https_traffic_only = "true"
  #allow_blob_public_access  = "true" # Explicitly required in later Azure RM Provider versions
  tags                      = {
    environment             = var.environment
  }
}

resource "azurerm_storage_container" "documents_gen" {
  count                 = local.shortenv != "test" && local.shortenv != "prod" ? 1 : 0 

  name                  = "documents"
  storage_account_name  = azurerm_storage_account.data_gen[0].name
  container_access_type = "blob"
}

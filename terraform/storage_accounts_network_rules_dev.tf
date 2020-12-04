# resource "azurerm_storage_account" "data_gen" {
#   count                     = local.shortenv != "testing" && local.shortenv != "production" ? 1 : 0 

#   name                      = "${var.project}${local.shortenv}"
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

# resource "azurerm_storage_container" "documents_gen" {
#   count                 = local.shortenv != "testing" && local.shortenv != "production" ? 1 : 0 

#   name                  = "documents"
#   storage_account_name  = azurerm_storage_account.data_gen[0].name
#   container_access_type = "blob"
# }

resource "azurerm_storage_account_network_rules" "data_gen_fw" {
  resource_group_name  = azurerm_resource_group.storage.name
  storage_account_name = azurerm_storage_account.data_gen[0].name

  default_action             = "Deny"
  ip_rules                   = [
    data.azurerm_key_vault_secret.bjssvpn.value,
    ]
  #virtual_network_subnet_ids = [azurerm_subnet.test.id]
  bypass                     = ["AzureServices"]
}
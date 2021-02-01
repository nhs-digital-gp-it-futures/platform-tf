resource "azurerm_storage_container" "documents" {
  #count                 = local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 0 

  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "blob"
}

# resource "azurerm_storage_container" "documents_pri" {
#   count                 = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 

#   name                  = "documents"
#   storage_account_name  = azurerm_storage_account.data_pri[0].name
#   container_access_type = "blob"
# }

# resource "azurerm_storage_container" "documents_pub" {
#   count                 = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 

#   name                  = "documents"
#   storage_account_name  = azurerm_storage_account.data_pub[0].name
#   container_access_type = "blob"
# }

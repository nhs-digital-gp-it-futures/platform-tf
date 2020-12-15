resource "azurerm_storage_account_network_rules" "data_gen_fw" {
  count                = local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 0 
  
  resource_group_name  = azurerm_resource_group.storage.name
  storage_account_name = azurerm_storage_account.data_gen[0].name

  default_action             = "Deny"
  ip_rules                   = [
    data.azurerm_key_vault_secret.bjssvpn.value,
    data.azurerm_key_vault_secret.nhsdvdi1.value, 
    data.azurerm_key_vault_secret.nhsdvdi2.value,
    ]
  virtual_network_subnet_ids = [azurerm_subnet.aks.id]
  bypass                     = ["AzureServices"]
}

resource "azurerm_storage_account_network_rules" "data_pri_fw" {
  count                = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 
  
  resource_group_name  = azurerm_resource_group.storage.name
  storage_account_name = azurerm_storage_account.data_pri[0].name

  default_action             = "Deny"
  ip_rules                   = [
    data.azurerm_key_vault_secret.bjssvpn.value,
    data.azurerm_key_vault_secret.nhsdvdi1.value, 
    data.azurerm_key_vault_secret.nhsdvdi2.value,
    ]
  virtual_network_subnet_ids = [azurerm_subnet.aks.id]
  bypass                     = ["AzureServices"]
}

resource "azurerm_storage_account_network_rules" "data_pub_fw" {
  count                = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 
  
  resource_group_name  = azurerm_resource_group.storage.name
  storage_account_name = azurerm_storage_account.data_pub[0].name

  default_action             = "Deny"
  ip_rules                   = [
    data.azurerm_key_vault_secret.bjssvpn.value,
    data.azurerm_key_vault_secret.nhsdvdi1.value, 
    data.azurerm_key_vault_secret.nhsdvdi2.value,
    ]
  virtual_network_subnet_ids = [azurerm_subnet.aks.id]
  bypass                     = ["AzureServices"]
}
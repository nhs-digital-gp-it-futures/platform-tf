resource "azurerm_storage_account_network_rules" "data_gen_fw" {
  resource_group_name  = azurerm_resource_group.storage.name
  storage_account_name = azurerm_storage_account.data_gen[0].name

  default_action             = "Deny"
  ip_rules                   = [
    data.azurerm_key_vault_secret.bjssvpn.value,
    ]
  virtual_network_subnet_ids = [azurerm_subnet.aks.id]
  bypass                     = ["AzureServices"]

  lifecycle {
    ignore_changes = [
      ip_rules, 
    ]
  }
}
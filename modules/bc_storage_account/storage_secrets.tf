resource "azurerm_key_vault_secret" "kv_sa_string" {
  #count        = local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 0 

  name         = var.kv_key 
  #value        = azurerm_storage_account.data_gen[0].primary_connection_string
  #value        = module.storage_account_gen[0].primary_connection_string
  value        = azurerm_storage_account.storage_account.primary_connection_string
  content_type = "${var.project}-Connection-String"
  key_vault_id = var.kv_id
  
  tags = {
    environment = var.environment
  }
}
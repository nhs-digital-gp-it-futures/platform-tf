resource "azurerm_key_vault_secret" "kv-sqluser" {
  name         = "${var.pjtcode}${local.shortEnv}sqladminusername"
  value        = var.kv_sqlusername
  content_type = "${var.project}-SQL-Username"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_access,
  ]
  
  tags = {
    environment = var.environment
  }
}

resource "random_password" "password1" {
  length = 16
  special = true
  override_special = "$_%@"
}
#random_password.password1.result

resource "azurerm_key_vault_secret" "kv-sqlpass" {
  name         = "${var.pjtcode}${local.shortEnv}sqladminpassword"
  value        = random_password.password1.result
  content_type = "${var.project}-SQL-password"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_access,
  ]
  
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv_addrprefix" {
  name         = "${var.pjtcode}${local.shortEnv}addrprefix"
  value        = var.kv_addrprefix
  content_type = "${var.project}-VNET-Address-prefix"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_access,
  ]
  
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv_coreurl" {
  name         = "${var.pjtcode}${local.shortEnv}coreurl"
  value        = var.kv_coreurl
  content_type = "${var.project}-core-url"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_access,
  ]
  
  tags = {
    environment = var.environment
  }
}
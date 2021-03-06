resource "azurerm_key_vault_secret" "kv-sqluser" {
  name         = "${var.pjtcode}${local.shortEnv}sqladminusername"
  value        = var.kv_sqlusername
  content_type = "${var.project}-SQL-Username"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  tags = {
    environment = var.environment
  }

  depends_on = [
    azurerm_management_lock.keyvault_lock
  ]
}

resource "random_password" "password1" {
  length            = 16
  special           = true
  override_special  = ".!-@"
  min_upper         = 1
  min_lower         = 1
  min_numeric       = 1
  min_special       = 1

  lifecycle {
    ignore_changes = [
      override_special,
    ]
  }
}

resource "azurerm_key_vault_secret" "kv-sqlpass" {
  name         = "${var.pjtcode}${local.shortEnv}sqladminpassword"
  value        = random_password.password1.result
  content_type = "${var.project}-SQL-password"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  tags = {
    environment = var.environment
  }

  depends_on = [
    azurerm_management_lock.keyvault_lock
  ]
}

resource "azurerm_key_vault_secret" "kv_addrprefix" {
  name         = "${var.pjtcode}${local.shortEnv}addrprefix"
  value        = var.kv_addrprefix
  content_type = "${var.project}-VNET-Address-prefix"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  tags = {
    environment = var.environment
  }

  depends_on = [
    azurerm_management_lock.keyvault_lock
  ]
}

resource "azurerm_key_vault_secret" "kv_coreurl" {
  name         = "${var.pjtcode}${local.shortEnv}coreurl"
  value        = var.kv_coreurl
  content_type = "${var.project}-core-url"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  tags = {
    environment = var.environment
  }

  depends_on = [
    azurerm_management_lock.keyvault_lock
  ]
}

resource "azurerm_key_vault_secret" "kv_certname_dynamic" {
  count = local.shortEnv != "development" && local.shortEnv != "preprod" && local.shortEnv != "production" ? 1 : 0  

  name         = "${var.pjtcode}${local.shortEnv}certname"
  value        = "dyn-buying-catalogue-digital-nhs-uk"
  content_type = "${var.project}-cert-name"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  tags = {
    environment = var.environment
  }

  depends_on = [
    azurerm_management_lock.keyvault_lock
  ]
}

resource "azurerm_key_vault_secret" "kv_certname_dev" {
  count = local.shortEnv == "development" ? 1 : 0  

  name         = "${var.pjtcode}${local.shortEnv}certname"
  value        = "dev-buying-catalogue-digital-nhs-uk"
  content_type = "${var.project}-cert-name"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  tags = {
    environment = var.environment
  }

  depends_on = [
    azurerm_management_lock.keyvault_lock
  ]
}

resource "azurerm_key_vault_secret" "kv_certname_live" {
  count = local.shortEnv == "preprod" || local.shortEnv == "production" ? 1 : 0  

  name         = "${var.pjtcode}${local.shortEnv}certname"
  value        = "buying-catalogue-digital-nhs-uk"
  content_type = "${var.project}-cert-name"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  tags = {
    environment = var.environment
  }

  depends_on = [
    azurerm_management_lock.keyvault_lock
  ]
}

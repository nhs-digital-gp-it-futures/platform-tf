resource "azurerm_key_vault_secret" "kv-sqluser" {
  count        = local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0

  name         = "${var.pjtcode}${local.shortEnv}sqladminusername"
  value        = var.kv_sqlusername
  content_type = "${var.project}-SQL-Username"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  tags = {
    environment = var.environment
  }

  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
}

resource "random_password" "password11" {
  count             = local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0
  length            = 16
  special           = true
  override_special  = "$_%@"
  min_upper         = 1
  min_lower         = 1
  min_numeric       = 1
  min_special       = 1
}

resource "azurerm_key_vault_secret" "kv-sqlpass" {
  count        = local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0

  name         = "${var.pjtcode}${local.shortEnv}sqladminpassword"
  value        = random_password.password11[0].result
  content_type = "${var.project}-SQL-password"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  tags = {
    environment = var.environment
  }

  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]

  lifecycle {
    ignore_changes = [
      value, 
    ]
  }
}

resource "azurerm_key_vault_secret" "kv_addrprefix" {
  count        = local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0

  name         = "${var.pjtcode}${local.shortEnv}addrprefix"
  value        = var.kv_addrprefix
  content_type = "${var.project}-VNET-Address-prefix"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  tags = {
    environment = var.environment
  }

  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
}

resource "azurerm_key_vault_secret" "kv_coreurl" {
  count        = local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0

  name         = "${var.pjtcode}${local.shortEnv}coreurl"
  value        = var.kv_coreurl
  content_type = "${var.project}-core-url"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  tags = {
    environment = var.environment
  }

  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
}

resource "azurerm_key_vault_secret" "kv_certname_live" {
  count        = local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0 

  name         = "${var.pjtcode}${local.shortEnv}certname"
  value        = "buying-catalogue-digital-nhs-uk"
  content_type = "${var.project}-cert-name"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  tags = {
    environment = var.environment
  }

  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
}

resource "azurerm_key_vault_secret" "kv_nhsdwfh" {
  count        = local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0 

  name         = "${var.pjtcode}${local.shortEnv}nhsdwfh"
  value        = ""
  content_type = "Specify IP Addresses (order: WR,LH,KW,DE,others)"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  tags = {
    environment = var.environment
  }

  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]

  lifecycle {
    ignore_changes = [
      value, 
    ]
  }
}

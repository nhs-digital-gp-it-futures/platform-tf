resource "azurerm_key_vault_access_policy" "keyvault_core_access" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  tenant_id    = var.tenant_id
  object_id    = var.keyvault_access_grp

  key_permissions = [

    "backup",
    "create",
    "decrypt",
    "delete",
    "encrypt",
    "get",
    "import",
    "list",
    "purge",
    "recover",
    "restore",
    "sign",
    "unwrapKey",
    "update",
    "verify",
    "wrapKey"
  ]

  secret_permissions = [

    "backup",
    "delete",
    "get",
    "list",
    "purge",
    "recover",
    "restore",
    "set"
  ]

  certificate_permissions = [

    "backup",
    "create",
    "delete",
    "deleteissuers",
    "get",
    "getissuers",
    "import",
    "list",
    "listissuers",
    "managecontacts",
    "manageissuers",
    "purge",
    "recover",
    "restore",
    "setissuers",
    "update"

  ]

  depends_on = [
    azurerm_key_vault.keyvault_core[0],
  ]
}

resource "azurerm_key_vault_access_policy" "keyvault_devops_access" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  tenant_id    = var.tenant_id
  object_id    = var.kv_appid
  
  key_permissions = [
  ]

  secret_permissions = [
    "get",
    "list"
  ]

  certificate_permissions = [
  ]

  depends_on = [
    azurerm_key_vault.keyvault_core[0],
  ]
}

data "azurerm_client_config" "current" {
}

resource "azurerm_key_vault_access_policy" "keyvault_current_access" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  tenant_id    = var.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions = [

    "backup",
    "create",
    "decrypt",
    "delete",
    "encrypt",
    "get",
    "import",
    "list",
    "purge",
    "recover",
    "restore",
    "sign",
    "unwrapKey",
    "update",
    "verify",
    "wrapKey"
  ]

  secret_permissions = [

    "backup",
    "delete",
    "get",
    "list",
    "purge",
    "recover",
    "restore",
    "set"
  ]

  certificate_permissions = [

    "backup",
    "create",
    "delete",
    "deleteissuers",
    "get",
    "getissuers",
    "import",
    "list",
    "listissuers",
    "managecontacts",
    "manageissuers",
    "purge",
    "recover",
    "restore",
    "setissuers",
    "update"

  ]

  depends_on = [
    azurerm_key_vault.keyvault_core[0],
  ]
}

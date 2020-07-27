resource "azurerm_key_vault_access_policy" "keyvault_access" {
  count = var.tenant_id == "50f6071f-bbfe-401a-8803-673748e629e2" ? 1 : 0 ##### CONDITIONAL - only create on NHS Tenant #####

  key_vault_id = azurerm_key_vault.keyvault.id
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
}


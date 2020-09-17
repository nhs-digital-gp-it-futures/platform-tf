resource "azurerm_key_vault_access_policy" "keyvault_aad_access" {
  key_vault_id   = data.azurerm_key_vault.keyvault_core.id
  tenant_id      = var.tenant_id
  object_id      = azurerm_user_assigned_identity.managed_id.principal_id

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

  # key_permissions = [
  # ]

  # secret_permissions = [

  #   # "get",
  #   # "list",
  #   "backup",
  # #  "delete",
  #   "get",
  #   "list",
  # #  "purge",
  #   "recover",
  #   "restore",
  #   "set"
  # ]

  # certificate_permissions = [

  #   "get",
  #   "getissuers",
  #   "list",
  #   "listissuers"
  # ]

  depends_on = [
    azurerm_user_assigned_identity.managed_id,
    data.azurerm_key_vault.keyvault_core,
  ]
}

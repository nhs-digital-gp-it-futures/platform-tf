resource "azurerm_management_lock" "keyvault_core_lock" {
  count = local.coreEnv == "development" || local.coreEnv == "testing" || local.coreEnv == "production" ? 1 : 0  

  name       = "write-lock-keyvault"
  scope      = azurerm_key_vault.keyvault_core[0].id
  lock_level = "CanNotDelete"
  notes      = "To prevent key vault being deleted - cannot be readonly"

  depends_on = [
    azurerm_key_vault_access_policy.keyvault_current_access,
    azurerm_key_vault_access_policy.keyvault_devops_access,
    azurerm_key_vault_access_policy.keyvault_core_access
  ]
}

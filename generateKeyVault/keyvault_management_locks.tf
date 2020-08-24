resource "azurerm_management_lock" "keyvault_lock" {
  name       = "write-lock-keyvault"
  scope      = azurerm_key_vault.keyvault.id
  lock_level = "CanNotDelete"
  notes      = "To prevent key vault being deleted"

  depends_on = [
    azurerm_key_vault_access_policy.keyvault_devops_access,
    azurerm_key_vault_access_policy,keyvault_access,
    azurerm_key_vault_access_policy,keyvault_current_access
  ]
}

resource "azurerm_management_lock" "keyvault_lock" {
  name       = "write-lock-keyvault"
  scope      = azurerm_key_vault.keyvault.id
  lock_level = "Delete"
  notes      = "To prevent key vault being deleted"
}

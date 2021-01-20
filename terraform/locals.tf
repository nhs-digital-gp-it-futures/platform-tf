locals {
  kv_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.project}-${var.keyvaultrg}/providers/Microsoft.KeyVault/vaults/${var.keyvault}"
  liveEnv = local.shortenv == "production" ? "prod" : "test"
  coreEnv = local.shortenv != "preprod" && local.shortenv != "production" ? "dev" : local.liveEnv
  corekv_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.project}-${local.coreEnv}-rg-kv/providers/Microsoft.KeyVault/vaults/${var.project}-${local.coreEnv}-core-kv"
  shortenv = replace(var.environment, "-", "")
  envURL = replace(data.azurerm_key_vault_secret.coreurl.value, "${var.environment}.","")
}

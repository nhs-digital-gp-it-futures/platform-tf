locals {
  shortenv = replace(var.environment, "-", "")
  # Top Level Environment Calculator
  liveEnv = local.shortenv == "production" ? "prod" : "test"
  coreEnv = local.shortenv != "preprod" && local.shortenv != "production" ? "dev" : local.liveEnv
  # KeyVault IDs
  kv_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.project}-${var.keyvaultrg}/providers/Microsoft.KeyVault/vaults/${var.keyvault}"
  corekv_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.project}-${local.coreEnv}-rg-kv/providers/Microsoft.KeyVault/vaults/${var.project}-${local.coreEnv}-core-kv"
  # Rancher URL calculator
  rancherEnv = local.shortenv != "preprod" && local.shortenv != "production" ? var.environment : local.liveEnv
  envURL = replace(data.azurerm_key_vault_secret.coreurl.value, "${local.rancherEnv}.","")
  # SQL Alternate Region
  sql_region2   = "ukwest"
  gw_webappLiveURL = "unknown"
  gw_webappURL = var.environment != "preprod" && var.environment != "production" ? join(".", ["webapp-${var.environment}", trim(data.azurerm_key_vault_secret.coreurl.value, "${var.environment}.")]) : local.gw_webappLiveURL
}

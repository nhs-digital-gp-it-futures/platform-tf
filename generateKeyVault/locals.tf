locals {
  shortEnv = replace("${var.environment}", "-", "")
  coreEnv = local.shortEnv != "test" && local.shortEnv != "prod" ? "dev" : local.shortEnv 
  corekv_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.project}-${local.coreEnv}-rg-kv/providers/Microsoft.KeyVault/vaults/${var.project}-${local.coreEnv}-core-kv"
}

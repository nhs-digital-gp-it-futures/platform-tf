data "azurerm_key_vault" "keyvault_core" {

  name                = "${var.project}-${local.coreEnv}-core-kv"
  resource_group_name = "${var.project}-${local.coreEnv}-rg-kv"
}

#data "azurerm_key_vault_secret" "spn" {
#  name         = "${var.pjtcode}${local.shortenv}spn"
#  key_vault_id = local.kv_id
#}

data "azurerm_key_vault_secret" "spnappid" {
  name         = "${var.pjtcode}${local.coreEnv}spnapplicationid"
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
}

data "azurerm_key_vault_secret" "spnsecret" {
  name         = "${var.pjtcode}${local.coreEnv}spnsecret"
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
}

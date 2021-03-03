data "azurerm_key_vault" "keyvault_core" {

  name                = "${var.project}-${local.coreEnv}-core-kv"
  resource_group_name = "${var.project}-${local.coreEnv}-rg-kv"
}

data "azurerm_key_vault_secret" "spnappid" {
  name         = "${local.pjtcode}${local.coreEnv}spnapplicationid"
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
}

data "azurerm_key_vault_secret" "spnsecret" {
  name         = "${local.pjtcode}${local.coreEnv}spnsecret"
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
}

data "azurerm_key_vault_secret" "ssl_cert" {
  name         = "${var.ssl_certname}-star"
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
}

data "azurerm_key_vault_secret" "bjssvpn" {
  name         = "${local.pjtcode}${local.coreEnv}bjssvpn"
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
}

data "azurerm_key_vault_secret" "mastekvpn1" {
  name         = "${local.pjtcode}${local.coreEnv}mastekvpn1"
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
}

data "azurerm_key_vault_secret" "mastekvpn2" {
  name         = "${local.pjtcode}${local.coreEnv}mastekvpn2"
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
}

data "azurerm_key_vault_secret" "kv_access" {
 name         = "${local.pjtcode}${local.coreEnv}KV-AccessGrp"
 key_vault_id = data.azurerm_key_vault.keyvault_core.id
}

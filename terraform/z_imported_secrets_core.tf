data "azurerm_key_vault" "keyvault_core" {

  name                = "${var.project}-${local.coreEnv}-core-kv"
  resource_group_name = "${var.project}-${local.coreEnv}-rg-kv"
}

data "azurerm_key_vault_secret" "spnappid" {
  name         = "${var.pjtcode}${local.coreEnv}spnapplicationid"
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
}

data "azurerm_key_vault_secret" "spnsecret" {
  name         = "${var.pjtcode}${local.coreEnv}spnsecret"
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
}

data "azurerm_key_vault_secret" "sqladmins" {
  name         = "${var.pjtcode}${local.coreEnv}SG-SQLAdmins"
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
}

data "azurerm_key_vault_secret" "ssl_cert" {
  name         = "${data.azurerm_key_vault_secret.certname.value}-star"
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
}

data "azurerm_key_vault_secret" "bjssvpn" {
  name         = "${var.pjtcode}${local.coreEnv}bjssvpn"
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
}

data "azurerm_key_vault_secret" "nhsdoffice1" {
  name         = "${var.pjtcode}${local.coreEnv}nhsdoffice1"
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
}

data "azurerm_key_vault_secret" "nhsdvdi1" {
  name         = "${var.pjtcode}${local.coreEnv}nhsdvdi1"
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
}

data "azurerm_key_vault_secret" "nhsdvdi2" {
  name         = "${var.pjtcode}${local.coreEnv}nhsdvdi2"
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
}

data "azurerm_key_vault_secret" "nhsdwfh" {
  count        = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 

  name         = "${var.pjtcode}${local.coreEnv}nhsdwfh"
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
}

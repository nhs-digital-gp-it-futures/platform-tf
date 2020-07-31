data "azurerm_key_vault_secret" "addrprefix" {
  name         = "${var.pjtcode}${local.shortenv}addrprefix"
  key_vault_id = local.kv_id
}

data "azurerm_key_vault_secret" "spnappid" {
  name         = "${var.pjtcode}${local.shortenv}spnapplicationid"
  key_vault_id = local.kv_id
}

data "azurerm_key_vault_secret" "spnsecret" {
  name         = "${var.pjtcode}${local.shortenv}spnsecret"
  key_vault_id = local.kv_id
}

data "azurerm_key_vault_secret" "aksversion" {
  name         = "${var.pjtcode}${local.shortenv}aksversion"
  key_vault_id = local.kv_id
}

data "azurerm_key_vault_secret" "aksvmsize" {
  name         = "${var.pjtcode}${local.shortenv}aksvmsize"
  key_vault_id = local.kv_id
}

data "azurerm_key_vault_secret" "sqladminusername" {
  name         = "${var.pjtcode}${local.shortenv}sqladminusername"
  key_vault_id = local.kv_id
}

data "azurerm_key_vault_secret" "sqladminpassword" {
  name         = "${var.pjtcode}${local.shortenv}sqladminpassword"
  key_vault_id = local.kv_id
}
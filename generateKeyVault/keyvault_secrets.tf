resource "azurerm_key_vault_secret" "kv-tenant" {
  name         = "${var.pjtcode}${var.environment}tenantid"
  value        = var.tenant_id
  content_type = "${var.project} Tenant ID"
  key_vault_id = azurerm_key_vault.keyvault.id
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv-subscription" {
  name         = "${var.pjtcode}${var.environment}subscriptionid"
  value        = var.subscription_id
  content_type = "${var.project} Subscription ID"
  key_vault_id = azurerm_key_vault.keyvault.id
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv-spn" {
  name         = "${var.pjtcode}${var.environment}serviceprincipalnameid"
  value        = var.kv_spn
  content_type = "${var.project} Service Principal"
  key_vault_id = azurerm_key_vault.keyvault.id
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv-appid" {
  name         = "${var.pjtcode}${var.environment}applicationid"
  value        = var.kv_appid
  content_type = "${var.project} Application ID"
  key_vault_id = azurerm_key_vault.keyvault.id
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv-spnsecret" {
  name         = "${var.pjtcode}${var.environment}secretkeyid"
  value        = var.kv_spnsecret
  content_type = "${var.project} Service Prinicpal Secret"
  key_vault_id = azurerm_key_vault.keyvault.id
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv-sqluser" {
  name         = "${var.pjtcode}${var.environment}sqladminusername"
  value        = var.kv_sqlusername
  content_type = "${var.project} Azure SQL username"
  key_vault_id = azurerm_key_vault.keyvault.id
  tags = {
    environment = var.environment
  }
}

resource "random_password" "password1" {
  length = 16
  special = true
  override_special = "$_%@"
}
#random_password.password1.result

resource "azurerm_key_vault_secret" "kv-sqlpass" {
  name         = "${var.pjtcode}${var.environment}sqladminpassword"
  value        = random_password.password1.result
  content_type = "${var.project} Azure SQL password"
  key_vault_id = azurerm_key_vault.keyvault.id
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv-sg-sql" {
  name         = "${var.project}-SG-SQLAdmins"
  value        = var.kv_sgsql
  content_type = "GRP-${var.project}-BC-SQL-Admins-DL"
  key_vault_id = "${azurerm_key_vault.keyvault.id}"
  tags = {
    environment = "${var.environment}"
  }
}

##### Redundant?

#resource "azurerm_key_vault_secret" "kv-sg-nonprod" {
#  name         = "Azure${var.project}-SG-NonProd-Subscriptin-Admins"
#  value        = var.kv_adminsdl
#  content_type = "GRP-AzureGPITFutures-BC-NonProd-Subscription-Admins-DL"
#  key_vault_id = "${azurerm_key_vault.keyvault.id}"
#  tags = {
#    environment = "${var.environment}"
#  }
#}

#resource "azurerm_key_vault_secret" "kv-sg-keyvault" {

#  name         = "AzureGPITFutures-SG-Kevault"
#  value        = var.keyvault_access_grp
#  content_type = "GRP-AzureGPITFutures-BC-KeyVault-Admins-DL"
#  key_vault_id = "${azurerm_key_vault.keyvault.id}"
#  tags = {
#    environment = "${var.environment}"
#  }
#}

#resource "azurerm_key_vault_secret" "kv-sppass" {
#}

#resource "azurerm_key_vault_secret" "kv-spuser" {
#}

#resource "azurerm_key_vault_secret" "kv-devopsuser" {
#}

#resource "azurerm_key_vault_secret" "kv-devopspassword" {
#}


#


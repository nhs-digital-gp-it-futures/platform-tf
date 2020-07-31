resource "azurerm_key_vault_secret" "kv-tenant" {
  name         = "${var.pjtcode}${local.shortenv}tenantid"
  value        = var.tenant_id
  content_type = "${var.project} Tenant ID"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_access,
  ]
  
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv-subscription" {
  name         = "${var.pjtcode}${local.shortenv}subscriptionid"
  value        = var.subscription_id
  content_type = "${var.project} Subscription ID"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_access,
  ]
  
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv-spn" {
  name         = "${var.pjtcode}${local.shortenv}spn"
  value        = var.kv_spn
  content_type = "${var.project} Service Principal"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_access,
  ]
  
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv-spnappid" {
  name         = "${var.pjtcode}${local.shortenv}spnapplicationid"
  value        = var.kv_appid
  content_type = "${var.project} SPN Application ID"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_access,
  ]
  
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv-spnsecret" {
  name         = "${var.pjtcode}${local.shortenv}spnsecret"
  value        = var.kv_spnsecret
  content_type = "${var.project} Service Prinicpal Secret"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_access,
  ]
  
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv-sqluser" {
  name         = "${var.pjtcode}${local.shortenv}sqladminusername"
  value        = var.kv_sqlusername
  content_type = "${var.project} Azure SQL username"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_access,
  ]
  
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
  name         = "${var.pjtcode}${local.shortenv}sqladminpassword"
  value        = random_password.password1.result
  content_type = "${var.project} Azure SQL password"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_access,
  ]
  
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv-sg-sql" {
  name         = "${var.pjtcode}${local.shortenv}SG-SQLAdmins"
  value        = var.kv_sgsql
  content_type = "GRP-${var.project}-BC-SQL-Admins-DL"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_access,
  ]
  
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv_addrprefix" {
  name         = "${var.pjtcode}${local.shortenv}addrprefix"
  value        = var.kv_addrprefix
  content_type = "${var.project}-Address-prefix"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_access,
  ]
  
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv_aksversion" {
  name         = "${var.pjtcode}${local.shortenv}aksversion"
  value        = var.kv_aksversion
  content_type = "${var.project}-AKS-Version"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_access,
  ]
  
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv_aksvmsize" {
  name         = "${var.pjtcode}${local.shortenv}aksvmsize"
  value        = var.kv_aksvmsize
  content_type = "${var.project}-AKS-VM-size"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_access,
  ]
  
  tags = {
    environment = var.environment
  }
}

# resource "azurerm_key_vault_secret" "kv-tenant" {
#   name         = "${var.pjtcode}${local.shortEnv}tenantid"
#   value        = var.tenant_id
#   content_type = "${var.project}-Tenant-ID"
#   key_vault_id = azurerm_key_vault.keyvault.id
  
#   depends_on = [
#     azurerm_key_vault_access_policy.keyvault_access,
#   ]
  
#   tags = {
#     environment = var.environment
#   }
# }

# resource "azurerm_key_vault_secret" "kv-subscription" {
#   name         = "${var.pjtcode}${local.shortEnv}subscriptionid"
#   value        = var.subscription_id
#   content_type = "${var.project}-Subscription-ID"
#   key_vault_id = azurerm_key_vault.keyvault.id
  
#   depends_on = [
#     azurerm_key_vault_access_policy.keyvault_access,
#   ]
  
#   tags = {
#     environment = var.environment
#   }
# }

# resource "azurerm_key_vault_secret" "kv-spn" {
#   name         = "${var.pjtcode}${local.shortEnv}spn"
#   value        = var.kv_spn
#   content_type = "${var.project}-SPN"
#   key_vault_id = azurerm_key_vault.keyvault.id
  
#   depends_on = [
#     azurerm_key_vault_access_policy.keyvault_access,
#   ]
  
#   tags = {
#     environment = var.environment
#   }
# }

# resource "azurerm_key_vault_secret" "kv-spnappid" {
#   name         = "${var.pjtcode}${local.shortEnv}spnapplicationid"
#   value        = var.kv_appid
#   content_type = "${var.project}-SPN-Application-ID"
#   key_vault_id = azurerm_key_vault.keyvault.id
  
#   depends_on = [
#     azurerm_key_vault_access_policy.keyvault_access,
#   ]
  
#   tags = {
#     environment = var.environment
#   }
# }

# resource "azurerm_key_vault_secret" "kv-spnsecret" {
#   name         = "${var.pjtcode}${local.shortEnv}spnsecret"
#   value        = var.kv_spnsecret
#   content_type = "${var.project}-SPN-Secret"
#   key_vault_id = azurerm_key_vault.keyvault.id
  
#   depends_on = [
#     azurerm_key_vault_access_policy.keyvault_access,
#   ]
  
#   tags = {
#     environment = var.environment
#   }
# }

resource "azurerm_key_vault_secret" "kv-sqluser" {
  name         = "${var.pjtcode}${local.shortEnv}sqladminusername"
  value        = var.kv_sqlusername
  content_type = "${var.project}-SQL-Username"
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
  name         = "${var.pjtcode}${local.shortEnv}sqladminpassword"
  value        = random_password.password1.result
  content_type = "${var.project}-SQL-password"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_access,
  ]
  
  tags = {
    environment = var.environment
  }
}

# resource "azurerm_key_vault_secret" "kv-sg-sql" {
#   name         = "${var.pjtcode}${local.shortEnv}SG-SQLAdmins"
#   value        = var.kv_sgsql
#   content_type = "gpitfutures-AKS-Admin-DL"
#   key_vault_id = azurerm_key_vault.keyvault.id
  
#   depends_on = [
#     azurerm_key_vault_access_policy.keyvault_access,
#   ]
  
#   tags = {
#     environment = var.environment
#   }
# }

resource "azurerm_key_vault_secret" "kv_addrprefix" {
  name         = "${var.pjtcode}${local.shortEnv}addrprefix"
  value        = var.kv_addrprefix
  content_type = "${var.project}-VNET-Address-prefix"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_access,
  ]
  
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv_aksversion" {
  name         = "${var.pjtcode}${local.shortEnv}aksversion"
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
  name         = "${var.pjtcode}${local.shortEnv}aksvmsize"
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

resource "azurerm_key_vault_secret" "kv_coreurl" {
  name         = "${var.pjtcode}${local.shortEnv}coreurl"
  value        = var.kv_coreurl
  content_type = "${var.project}-core-url"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_access,
  ]
  
  tags = {
    environment = var.environment
  }
}
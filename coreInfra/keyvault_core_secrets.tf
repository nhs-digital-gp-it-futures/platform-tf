resource "azurerm_key_vault_secret" "kv-tenant" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  name         = "${var.pjtcode}${local.coreEnv}tenantid"
  value        = var.tenant_id
  content_type = "${var.project}-Tenant-ID"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
  
  tags = {
    environment = local.coreEnv
  }
}

resource "azurerm_key_vault_secret" "kv-subscription" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  name         = "${var.pjtcode}${local.coreEnv}subscriptionid"
  value        = var.subscription_id
  content_type = "${var.project}-Subscription-ID"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
  
  tags = {
    environment = local.coreEnv
  }
}

resource "azurerm_key_vault_secret" "kv-spn" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  name         = "${var.pjtcode}${local.coreEnv}spn"
  value        = var.kv_spn
  content_type = "${var.project}-SPN"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
  
  tags = {
    environment = local.coreEnv
  }
}

resource "azurerm_key_vault_secret" "kv-spnappid" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  name         = "${var.pjtcode}${local.coreEnv}spnapplicationid"
  value        = var.kv_appid
  content_type = "${var.project}-SPN-Application-ID"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
  
  tags = {
    environment = local.coreEnv
  }
}

resource "azurerm_key_vault_secret" "kv-spnsecret" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  name         = "${var.pjtcode}${local.coreEnv}spnsecret"
  value        = var.kv_spnsecret
  content_type = "${var.project}-SPN-Secret"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
  
  tags = {
    environment = local.coreEnv
  }
}

resource "azurerm_key_vault_secret" "kv-sg-sql" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  name         = "${var.pjtcode}${local.coreEnv}SG-SQLAdmins"
  value        = var.kv_sgsql
  content_type = "${var.project}-SQL-Admin-DL"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
  
  tags = {
    environment = local.coreEnv
  }
}

resource "azurerm_key_vault_secret" "kv-sqladmins" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  name         = "${var.pjtcode}${local.coreEnv}-SQL-admins"
  value        = var.kv_sqladmins
  content_type = "${var.project}-SQL-Login-Admins"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
  
  tags = {
    environment = local.coreEnv
  }
}

resource "azurerm_key_vault_secret" "kv-kv-access-dl" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  name         = "${var.pjtcode}${local.coreEnv}KV-AccessGrp"
  value        = var.keyvault_access_grp
  content_type = "${var.project}-keyvault-access-DL"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
  
  tags = {
    environment = local.coreEnv
  }
}

resource "azurerm_key_vault_secret" "kv-tfstoragekey" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  name         = "${var.pjtcode}${local.coreEnv}tf-storagekey"
  value        = var.kv_tfsakey
  content_type = "${var.project}-tf-storagekey"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
  
  tags = {
    environment = local.coreEnv
  }
}

resource "random_password" "password1" {
  count             = local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  length            = 16
  special           = true
  override_special  = "$_%@"
  min_upper         = 1
  min_lower         = 1
  min_numeric       = 1
  min_special       = 1
}

resource "azurerm_key_vault_secret" "kv-srtcookiesecret" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  name         = "srt-cookiesecret"
  value        = var.kv_srtcookiesecret != "" ? var.kv_srtcookiesecret : random_password.password1[0].result
  content_type = "The secret needed for encoding and decoding the cookie"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
  
  tags = {
    environment = local.coreEnv
  }
}

resource "random_password" "password2" {
  count             = local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  length            = 16
  special           = true
  override_special  = "$_%@"
  min_upper         = 1
  min_lower         = 1
  min_numeric       = 1
  min_special       = 1
}

resource "azurerm_key_vault_secret" "kv_srtclientsecret" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  name         = "srt-clientsecret"
  value        = var.kv_srtclientsecret != "" ? var.kv_srtclientsecret : random_password.password2[0].result
  content_type = "Client secret for ${local.coreEnv}"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
  
  tags = {
    environment = local.coreEnv
  }
}

resource "random_password" "password3" {
  count             = local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  length            = 16
  special           = true
  override_special  = "$_%@"
  min_upper         = 1
  min_lower         = 1
  min_numeric       = 1
  min_special       = 1
}

resource "azurerm_key_vault_secret" "kv_sqldevdbpass" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  name         = "srt-sqldevdbpass"
  value        = var.kv_sqldevdbpass != "" ? var.kv_sqldevdbpass : random_password.password3[0].result
  content_type = "Dev DB Password"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
  
  tags = {
    environment = local.coreEnv
  }
}

resource "azurerm_key_vault_secret" "kv_bjssvpn" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  name         = "${var.pjtcode}${local.coreEnv}bjssvpn"
  value        = var.kv_bjssvpn
  content_type = "BJSS VPN"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
  
  tags = {
    environment = local.coreEnv
  }
}

resource "azurerm_key_vault_secret" "kv_nhdsvdi1" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  name         = "${var.pjtcode}${local.coreEnv}nhsdvdi1"
  value        = var.kv_nhdsvdi1
  content_type = "NHS Digital VDI IP Range 1"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
  
  tags = {
    environment = local.coreEnv
  }
}

resource "azurerm_key_vault_secret" "kv_nhdsvdi2" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  name         = "${var.pjtcode}${local.coreEnv}nhsdvdi2"
  value        = var.kv_nhdsvdi2
  content_type = "NHS Digital VDI IP Range 2"
  key_vault_id = azurerm_key_vault.keyvault_core[0].id
  
  depends_on = [
    azurerm_key_vault_access_policy.keyvault_core_access[0],
  ]
  
  tags = {
    environment = local.coreEnv
  }
}

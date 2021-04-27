module "appgw_public" {
  source                  = "github.com/nhs-digital-gp-it-futures/platform-tf-modules/bc_app_gateway_ingress_rancher_webapp"

  count                   = local.shortenv != "production" ? 1 : 0 
  
  environment             = var.environment
  region                  = var.region
  rg_name                 = azurerm_resource_group.appgw.name
  ag_name                 = "${var.project}-${var.environment}-appgw"
  ag_name_fragment        = "${var.project}-${var.environment}"
  ag_capacity             = local.shortenv != "preprod" && local.shortenv != "production" ? "1" : "2"
  ag_subnet_id            = azurerm_subnet.gateway.id
  core_url                = data.azurerm_key_vault_secret.coreurl.value
  ssl_cert_name           = data.azurerm_key_vault_secret.certname.value
  ssl_cert_secret_id      = trimsuffix(data.azurerm_key_vault_secret.ssl_cert.id, data.azurerm_key_vault_secret.ssl_cert.version) # data.azurerm_key_vault_secret.ssl_cert.id
  managed_id_principal_id = azurerm_user_assigned_identity.managed_id.principal_id
  dns_name                = "buyingcatalogue${local.shortenv}"
  pip_name                = "${var.project}-${var.environment}-pip"
  webapp_name             = module.webapp[0].webapp_name
  webapp_url              = local.gw_webappURL

  depends_on = [
    azurerm_key_vault_access_policy.keyvault_aad_access,
    azurerm_network_security_rule.Azure,
  ]
}

module "appgw_private" {
  source                  = "github.com/nhs-digital-gp-it-futures/platform-tf-modules/bc_app_gateway_ingress"
    
  count                   = local.shortenv == "preprod" ? 1 : 0 
  
  environment             = var.environment
  region                  = var.region
  rg_name                 = azurerm_resource_group.appgw.name
  ag_name                 = "${var.project}-${var.environment}-appgw-pri"
  ag_name_fragment        = "${var.project}-${var.environment}"
  ag_capacity             = local.shortenv != "preprod" && local.shortenv != "production" ? "1" : "2"
  ag_subnet_id            = azurerm_subnet.gateway.id
  core_url                = "private.${data.azurerm_key_vault_secret.coreurl.value}"
  ssl_cert_name           = data.azurerm_key_vault_secret.certname.value
  ssl_cert_secret_id      = trimsuffix(data.azurerm_key_vault_secret.ssl_cert.id, data.azurerm_key_vault_secret.ssl_cert.version)
  managed_id_principal_id = azurerm_user_assigned_identity.managed_id.principal_id
  dns_name                = "buyingcatalogue${local.shortenv}pri"
  pip_name                = "${var.project}-${var.environment}-pip-pri"

  depends_on = [
    azurerm_key_vault_access_policy.keyvault_aad_access,
    azurerm_network_security_rule.Azure,
  ]
}

module "appgw_public_prod" {
  source                  = "github.com/nhs-digital-gp-it-futures/platform-tf-modules/bc_app_gateway_ingress_rancher_webapp"
  
  count                   = local.shortenv == "production" ? 1 : 0 
  
  environment             = var.environment
  region                  = var.region
  rg_name                 = azurerm_resource_group.appgw.name
  ag_name                 = "${var.project}-${var.environment}-appgw"
  ag_name_fragment        = "${var.project}-${var.environment}"
  ag_capacity             = local.shortenv != "preprod" && local.shortenv != "production" ? "1" : "2"
  ag_subnet_id            = azurerm_subnet.gateway.id
  core_url                = data.azurerm_key_vault_secret.coreurl.value
  ssl_cert_name           = data.azurerm_key_vault_secret.certname.value
  ssl_cert_secret_id      = trimsuffix(data.azurerm_key_vault_secret.ssl_cert.id, data.azurerm_key_vault_secret.ssl_cert.version)
  managed_id_principal_id = azurerm_user_assigned_identity.managed_id.principal_id
  dns_name                = "buyingcatalogue${local.shortenv}"
  pip_name                = "${var.project}-${var.environment}-pip"
  webapp_name             = module.webapp[0].webapp_name
  webapp_url              = local.gw_webappURL

  depends_on = [
    azurerm_key_vault_access_policy.keyvault_aad_access,
    azurerm_network_security_rule.Azure,
  ]
}

module "appgw_private_prod" {
  source                  = "github.com/nhs-digital-gp-it-futures/platform-tf-modules/bc_app_gateway_ingress_rancher_webapp"

  count                   = local.shortenv == "production" ? 1 : 0 
  
  environment             = var.environment
  region                  = var.region
  rg_name                 = azurerm_resource_group.appgw.name
  ag_name                 = "${var.project}-${var.environment}-appgw-pri"
  ag_name_fragment        = "${var.project}-${var.environment}"
  ag_capacity             = local.shortenv != "preprod" && local.shortenv != "production" ? "1" : "2"
  ag_subnet_id            = azurerm_subnet.gateway.id
  core_url                = "private.${data.azurerm_key_vault_secret.coreurl.value}"
  ssl_cert_name           = data.azurerm_key_vault_secret.certname.value
  ssl_cert_secret_id      = trimsuffix(data.azurerm_key_vault_secret.ssl_cert.id, data.azurerm_key_vault_secret.ssl_cert.version)
  managed_id_principal_id = azurerm_user_assigned_identity.managed_id.principal_id
  dns_name                = "buyingcatalogue${local.shortenv}pri"
  pip_name                = "${var.project}-${var.environment}-pip-pri"
  webapp_name             = module.webapp[0].webapp_name
  webapp_url              = local.gw_webappURL

  depends_on = [
    azurerm_key_vault_access_policy.keyvault_aad_access,
    azurerm_network_security_rule.Azure,
  ]
}

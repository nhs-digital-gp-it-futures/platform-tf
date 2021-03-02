module "appgw_public" {
  source                  = "github.com/nhs-digital-gp-it-futures/platform-tf-modules/bc_app_gateway_ingress_rancher"

  environment             = var.environment
  region                  = var.region
  rg_name                 = azurerm_resource_group.appgw.name
  ag_name                 = "${var.project}-${var.environment}-appgw"
  ag_name_fragment        = "${var.project}-${var.environment}"
  ag_capacity             = "1"
  ag_subnet_id            = azurerm_subnet.gateway.id
  core_url                = azurerm_dns_cname_record.rancher_cname.fqdn
  ssl_cert_name           = var.ssl_certname
  ssl_cert_secret_id      = trimsuffix(data.azurerm_key_vault_secret.ssl_cert.id, data.azurerm_key_vault_secret.ssl_cert.version) # data.azurerm_key_vault_secret.ssl_cert.id
  managed_id_principal_id = azurerm_user_assigned_identity.managed_id.principal_id
  dns_name                = "${local.pjtcode}rancher"
  pip_name                = "${var.project}-${var.environment}-pip"

  depends_on = [
    azurerm_network_security_rule.Azure,
    azurerm_key_vault_access_policy.keyvault_core_managed_id_access
  ]
}

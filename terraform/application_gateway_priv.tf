resource "azurerm_public_ip" "PipAppGwPri" {
  count               = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0
  
  name                = "${var.project}-${var.environment}-pip-pri"
  location            = var.region
  domain_name_label   = "buyingcatalogue${local.shortenv}pri"
  resource_group_name = azurerm_resource_group.appgw.name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = {
    environment       = var.environment
  }
}

resource "azurerm_application_gateway" "AppGwPri" {
  count                            = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0

  name                             = "${var.project}-${var.environment}-appgw-pri"
  location                         = var.region
  resource_group_name              = azurerm_resource_group.appgw.name

  sku {
    name                           = local.ag_skuname
    tier                           = local.ag_tier
    capacity                       = local.ag_capacity
  }

  gateway_ip_configuration {
    name                           = "${var.project}-${var.environment}-gwip"
    subnet_id                      = azurerm_subnet.gateway.id
  }

  frontend_ip_configuration {
    name                           = "${var.project}-${var.environment}-appgw-feip"
    public_ip_address_id           = azurerm_public_ip.PipAppGwPri[0].id
  }

  backend_address_pool {
    name                           = "${var.project}-${var.environment}-appgw-beap"
  }

  backend_http_settings {
    name                           = "${var.project}-${var.environment}-appgw-be-htst"
    cookie_based_affinity          = "Disabled"
    path                           = "/path/"
    port                           = 80
    protocol                       = "Http"
    request_timeout                = 1
  }

  # HTTP
  frontend_port {
    name                           = "${var.project}-${var.environment}-appgw-feport"
    port                           = 80
  }

  http_listener {
    name                           = "${var.project}-${var.environment}-appgw-httplstn"
    frontend_ip_configuration_name = "${var.project}-${var.environment}-appgw-feip"
    frontend_port_name             = "${var.project}-${var.environment}-appgw-feport"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                          = "${var.project}-${var.environment}-appgw-rqrt"
    rule_type                     = "Basic"
    http_listener_name            = "${var.project}-${var.environment}-appgw-httplstn"
    backend_address_pool_name     = "${var.project}-${var.environment}-appgw-beap"
    backend_http_settings_name    = "${var.project}-${var.environment}-appgw-be-htst"
  }

  ssl_policy {
    policy_type                   = "Predefined"
    policy_name                   = "AppGwSslPolicy20170401S"
  }

  # HTTPS
  frontend_port {
    name                           = "${var.project}-${var.environment}-appgw-feporthttps"
    port                           = 443
  }
  
  http_listener {
    name                           = "${var.project}-${var.environment}-appgw-pub-httpslstn"
    frontend_ip_configuration_name = "${var.project}-${var.environment}-appgw-feip"
    frontend_port_name             = "${var.project}-${var.environment}-appgw-feporthttps"
    protocol                       = "HTTPS"
    host_name                      = "www.private.${data.azurerm_key_vault_secret.coreurl.value}" 
    ssl_certificate_name           = data.azurerm_key_vault_secret.certname.value
  }

  http_listener {
    name                           = "${var.project}-${var.environment}-appgw-pub-httplstn"
    frontend_ip_configuration_name = "${var.project}-${var.environment}-appgw-feip"
    frontend_port_name             = "${var.project}-${var.environment}-appgw-feport"
    protocol                       = "HTTP"
    host_name                      = "www.private.${data.azurerm_key_vault_secret.coreurl.value}"
  }

  redirect_configuration {
    name                          = "${var.project}-${var.environment}-appgw-rdrcfg"
    redirect_type                 = "Permanent"
    target_url                    = "https://private.${data.azurerm_key_vault_secret.coreurl.value}"
    include_path                  = true
    include_query_string          = true
  }

  request_routing_rule {
    name                          = "${var.project}-${var.environment}-appgw-pub-httpsrqrt"
    rule_type                     = "Basic"
    http_listener_name            = "${var.project}-${var.environment}-appgw-pub-httpslstn"
    redirect_configuration_name   = "${var.project}-${var.environment}-appgw-rdrcfg"
  }

  request_routing_rule {
    name                          = "${var.project}-${var.environment}-appgw-pub-httprqrt"
    rule_type                     = "Basic"
    http_listener_name            = "${var.project}-${var.environment}-appgw-pub-httplstn"
    redirect_configuration_name   = "${var.project}-${var.environment}-appgw-rdrcfg"
  }
  
  ssl_certificate {
     name = data.azurerm_key_vault_secret.certname.value
     key_vault_secret_id = data.azurerm_key_vault_secret.ssl_cert.id   
  }

  identity {
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.managed_id.id]
  }

  tags = {
    environment       = var.environment
  }

  depends_on = [
    azurerm_network_security_rule.Azure,
    azurerm_key_vault_access_policy.keyvault_aad_access
  ]

  lifecycle {
    # AGIC owns most app gateway settings, so we should ignore differences
    ignore_changes = [
      #gateway_ip_configuration,
      request_routing_rule, 
      http_listener, 
      backend_http_settings, 
      #frontend_ip_configuration, 
      frontend_port,
      backend_address_pool,
      probe,
      redirect_configuration,      
      url_path_map,     
      tags,
      #ssl_certificate # see issue above
    ]
  }
}
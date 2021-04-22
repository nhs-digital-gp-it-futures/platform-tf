data "azurerm_dns_zone" "dyn_zone" {
    count               = local.shortenv != "development" && local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 0
    name                = "dynamic.buyingcatalogue.digital.nhs.uk"
    resource_group_name = "gpitfutures-dynamic-rg"
}

resource "azurerm_dns_cname_record" "dyn_cname" {
    count               = local.shortenv != "development" && local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 0
    name                = var.environment
    zone_name           = data.azurerm_dns_zone.dyn_zone[0].name
    resource_group_name = "gpitfutures-dynamic-rg"
    ttl                 = 60
    record              = module.appgw_public[0].appgw_pip_fqdn

    depends_on = [
      module.appgw_public[0]
    ]
}

resource "azurerm_dns_cname_record" "rancher_cname" {
    count               = local.shortenv != "development" && local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 0
    name                = "rancher-${var.environment}"
    zone_name           = data.azurerm_dns_zone.dyn_zone[0].name
    resource_group_name = "gpitfutures-dynamic-rg"
    ttl                 = 60
    record              = module.appgw_public[0].appgw_pip_fqdn

    depends_on = [
        module.appgw_public[0]
    ]
}

resource "azurerm_dns_cname_record" "www_cname" {
    count               = local.shortenv != "development" && local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 0
    name                = "www.${var.environment}"
    zone_name           = data.azurerm_dns_zone.dyn_zone[0].name
    resource_group_name = "gpitfutures-dynamic-rg"
    ttl                 = 60
    record              = module.appgw_public[0].appgw_pip_fqdn

    depends_on = [
        module.appgw_public[0]
    ]
}

resource "azurerm_dns_cname_record" "webapp" {
    count               = local.shortenv != "development" && local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 0
    name                = "webapp-${var.environment}"
    zone_name           = data.azurerm_dns_zone.dyn_zone[0].name
    resource_group_name = "gpitfutures-dynamic-rg"
    ttl                 = 60
    record              = module.appgw_public[0].appgw_pip_fqdn

    depends_on = [
        module.appgw_public[0]
    ]
}

# resource "azurerm_dns_txt_record" "webapp_txt" {
#     count               = local.shortenv != "development" && local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 0
#     name                = "asuid"
#     zone_name           = data.azurerm_dns_zone.dyn_zone[0].name
#     resource_group_name = "gpitfutures-dynamic-rg"
#     ttl                 = 60

#     record {
#         value = module.webapp[0].webapp_verification_id
#     }

#     depends_on = [
#         module.webapp[0]
#     ]
# }

# resource "azurerm_dns_a_record" "webapp_a" {
#     count               = local.shortenv != "development" && local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 0
#     name                = "@"
#     zone_name           = data.azurerm_dns_zone.dyn_zone[0].name
#     resource_group_name = "gpitfutures-dynamic-rg"
#     ttl                 = 60
#     records             = [module.webapp[0].webapp_outbound_ip_addresses]

#     depends_on = [
#         module.webapp[0]
#     ]
# }

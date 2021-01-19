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
    record              = azurerm_public_ip.PipAppGw.fqdn
}

resource "azurerm_dns_cname_record" "rancher_cname" {
    count               = local.shortenv != "development" && local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 0
    name                = "rancher-${var.environment}"
    zone_name           = data.azurerm_dns_zone.dyn_zone[0].name
    resource_group_name = "gpitfutures-dynamic-rg"
    ttl                 = 60
    record              = azurerm_public_ip.PipAppGw.fqdn
}

resource "azurerm_dns_cname_record" "www_cname" {
    count               = local.shortenv != "development" && local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 0
    name                = "www.${var.environment}"
    zone_name           = data.azurerm_dns_zone.dyn_zone[0].name
    resource_group_name = "gpitfutures-dynamic-rg"
    ttl                 = 60
    record              = azurerm_public_ip.PipAppGw.fqdn
}

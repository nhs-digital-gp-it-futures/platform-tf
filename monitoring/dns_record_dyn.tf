data "azurerm_dns_zone" "dyn_zone" {
    name                = "dynamic.buyingcatalogue.digital.nhs.uk"
    resource_group_name = "gpitfutures-dynamic-rg"
}

resource "azurerm_dns_cname_record" "rancher_cname" {
    name                = "rancher"
    zone_name           = data.azurerm_dns_zone.dyn_zone.name
    resource_group_name = "gpitfutures-dynamic-rg"
    ttl                 = 60
    record              = module.appgw_public.appgw_pip_fqdn

}

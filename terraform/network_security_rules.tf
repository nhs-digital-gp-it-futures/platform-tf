resource "azurerm_network_security_rule" "CorpAccess" {
  name                        = "AllowNHSDCorpIp"
  resource_group_name         = azurerm_resource_group.appgw.name
  network_security_group_name = azurerm_network_security_group.gateway.name
  source_address_prefixes     = [data.azurerm_key_vault_secret.nhsdoffice1.value]
  destination_address_prefix  = "*"
  source_port_range           = "*"
  destination_port_ranges     = [ "80", "443" ]
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  priority                    = "150"
  description                 = "Allow staff access who work within approved offices"
}
# nhsdoffice1

resource "azurerm_network_security_rule" "VPN_Access" {
  name                        = "AllowBjssVpn"
  resource_group_name         = azurerm_resource_group.appgw.name
  network_security_group_name = azurerm_network_security_group.gateway.name
  source_address_prefix       = data.azurerm_key_vault_secret.bjssvpn.value
  destination_address_prefix  = "*"
  source_port_range           = "*"
  destination_port_ranges     = [ "80", "443" ]
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  priority                    = "160"
  description                 = "Allow staff access who are connect to the BJSS VPN"
}

resource "azurerm_network_security_rule" "NHSD_VDI_Access" {
  name                        = "AllowNHSDVDI"
  resource_group_name         = azurerm_resource_group.appgw.name
  network_security_group_name = azurerm_network_security_group.gateway.name
  source_address_prefixes     = [ 
    data.azurerm_key_vault_secret.nhsdvdi1.value, 
    data.azurerm_key_vault_secret.nhsdvdi2.value 
    ]
  destination_address_prefix  = "*"
  source_port_range           = "*"
  destination_port_ranges     = [ "80", "443" ]
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  priority                    = "170"
  description                 = "Allow NHSD staff access who are using NHSD VDI"
}

resource "azurerm_network_security_rule" "NHSD_wfh_Access" {
  count                       = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 

  name                        = "AllowNHSDwfh"
  resource_group_name         = azurerm_resource_group.appgw.name
  network_security_group_name = azurerm_network_security_group.gateway.name
  source_address_prefixes     = ["127.0.0.1"]
  destination_address_prefix  = "*"
  source_port_range           = "*"
  destination_port_ranges     = [ "80", "443" ]
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  priority                    = "180"
  description                 = "List should include: ${data.azurerm_key_vault_secret.nhsdwfh[0].value}"

  lifecycle {
    ignore_changes = [
      source_address_prefix,
      source_address_prefixes, 
      description
    ]
  }
}

resource "azurerm_network_security_rule" "Mastek_VPN_Access" {
  name                        = "AllowMastekVpns"
  resource_group_name         = azurerm_resource_group.appgw.name
  network_security_group_name = azurerm_network_security_group.gateway.name
  source_address_prefixes     = [data.azurerm_key_vault_secret.mastekvpn1.value,data.azurerm_key_vault_secret.mastekvpn2.value]
  destination_address_prefix  = "*"
  source_port_range           = "*"
  destination_port_ranges     = [ "80", "443" ]
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  priority                    = "190"
  description                 = "Allow staff access who are connect to the Mastek VPNs"
}

resource "azurerm_network_security_rule" "DevOps" {
  name                        = "AllowAzureDevOps"
  resource_group_name         = azurerm_resource_group.appgw.name
  network_security_group_name = azurerm_network_security_group.gateway.name
  source_address_prefix       = "AzureCloud"
  destination_address_prefix  = "*"
  source_port_range           = "*"
  destination_port_ranges     = [ "80", "443" ]
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  priority                    = 200
  description                 = "Allow AzureDevOps access to this environment"
}

resource "azurerm_network_security_rule" "Azure" {
  name                        = "AllowAzureInfrastructurePorts"
  resource_group_name         = azurerm_resource_group.appgw.name
  network_security_group_name = azurerm_network_security_group.gateway.name
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  source_port_range           = "*"
  destination_port_range      = "65200-65535"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  priority                    = "500"
  description                 = "Allow incoming Azure Gateway Manager and inbound virtual network traffic (VirtualNetwork tag) on the NSG."
}

resource "azurerm_network_security_rule" "selenium_deny" {
  name                        = "selenium_deny"
  resource_group_name         = azurerm_resource_group.aks.name
  network_security_group_name = azurerm_network_security_group.aks.name
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
  source_port_range           = "*"
  destination_port_ranges     = [ "4444" ]
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  priority                    = 499
  description                 = "Stops Selenium Grid advertising externally on TCP 4444"
}

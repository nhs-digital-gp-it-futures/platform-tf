resource "azurerm_kubernetes_cluster" "aksdev" {
  count                           = local.shortenv != "testing" && local.shortenv != "production" ? 1 : 0 

  name                            = "${var.project}-${var.environment}-aks"
  resource_group_name             = azurerm_resource_group.aks.name
  kubernetes_version              = local.kv_aksversion
  location                        = var.region
  dns_prefix                      = "${var.project}${var.environment}aksdns"
  node_resource_group             = "${var.project}-${var.environment}-rg-aks-nodes"

  default_node_pool {
    name                          = "devnodepool"
    vm_size                       = local.kv_aksvmsize
    vnet_subnet_id                = azurerm_subnet.aks.id
    type                          = "VirtualMachineScaleSets"
    enable_auto_scaling           = "true"
    max_pods                      = 110
    max_count                     = local.kv_aksmaxnodes
    min_count                     = local.kv_aksminnodes
    node_count                    = local.kv_aksinitnodes
    availability_zones            = [1,2,3]
    tags = {
      environment                 = var.environment
    }
  }

  # azure_policy {
  #   enabled = "true"
  # }

  service_principal {
    client_id                     = data.azurerm_key_vault_secret.spnappid.value
    client_secret                 = data.azurerm_key_vault_secret.spnsecret.value
  }

  network_profile {
    load_balancer_sku             = "standard"
    network_plugin                = "azure"
    network_policy                = "azure"
    service_cidr                  = "${data.azurerm_key_vault_secret.addrprefix.value}.128.0/24"
    docker_bridge_cidr            = "${data.azurerm_key_vault_secret.addrprefix.value}.129.1/24"
    dns_service_ip                = "${data.azurerm_key_vault_secret.addrprefix.value}.128.111"
  }

  addon_profile {
    kube_dashboard {
      enabled                     = "true"
    }

    oms_agent {
      enabled                     = false
    }
  }

  api_server_authorized_ip_ranges = [
    "${data.azurerm_key_vault_secret.bjssvpn.value}/32",
    ]

  enable_pod_security_policy      = "false"

  role_based_access_control {
    enabled                       = "true"
  }

  # ### May be needed for key vault integration ###
  # identity {
  #   type = "SystemAssigned"
  # } 

  tags = {
    environment                   = var.environment
  }

lifecycle {
    ignore_changes = [
      default_node_pool[0].node_count
    ]
  }
}
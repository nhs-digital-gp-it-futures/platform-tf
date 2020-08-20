resource "azurerm_kubernetes_cluster" "aks" {
  name                            = "${var.project}-${var.environment}-aks"
  resource_group_name             = azurerm_resource_group.aks.name
  kubernetes_version              = local.kv_aksversion
  location                        = var.region
  dns_prefix                      = "${var.project}${var.environment}aksdns"
  node_resource_group             = "${var.project}-${var.environment}-rg-aks-nodes"

  default_node_pool {
    name                          = "nodepool"
    vm_size                       = local.kv_aksvmsize
    vnet_subnet_id                = azurerm_subnet.aks.id
    type                          = "VirtualMachineScaleSets"
    enable_auto_scaling           = "true"
    max_pods                      = 110
    max_count                     = 2
    min_count                     = 1
    node_count                    = 1
    tags = {
      environment                 = var.environment
    }
  }

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
      #log_analytics_workspace_id  = azurerm_log_analytics_workspace.workspace.id
    }
  }

  api_server_authorized_ip_ranges = []

  enable_pod_security_policy      = "false"

  role_based_access_control {
    enabled                       = "true"
  }

  tags = {
    environment                   = var.environment
  }

lifecycle {
    # re-imported cluster means client secret is trying to regenerate mistakenly
    ignore_changes = [
      #service_principal[0].client_secret,
      default_node_pool[0].node_count
    ]
  }
}
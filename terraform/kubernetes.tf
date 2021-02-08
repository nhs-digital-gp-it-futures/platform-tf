module "kubernetes" {
  source            = "github.com/nhs-digital-gp-it-futures/platform-tf-modules/bc_kubernetes"

  environment       = var.environment
  region            = var.region
  project           = var.project
  rg_name           = azurerm_resource_group.aks.name
  ag_name_fragment  = "${var.project}-${var.environment}"
  aks_version       = "1.18.10"
  aks_sku_tier      = local.shortenv != "preprod" && local.shortenv != "production" ? "Free" : "Paid"
  aks_nodepool      = "${local.coreEnv}nodepool"
  aks_vmsize        = "Standard_F4s_v2"
  aks_init_nodes    = local.shortenv != "development" && local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 2
  aks_max_nodes     = local.shortenv != "development" && local.shortenv != "preprod" && local.shortenv != "production" ? 2 : 3
  aks_min_nodes     = local.shortenv != "development" && local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 1
  aks_subnet_id     = azurerm_subnet.aks.id
  subnet_prefix     = data.azurerm_key_vault_secret.addrprefix.value
  aks_dns_prefix    = "${var.project}${var.environment}aksdns"
  ip_rules          = [
    "${data.azurerm_key_vault_secret.bjssvpn.value}/32",
  ]
  spn_id            = data.azurerm_key_vault_secret.spnappid.value
  spn_secret        = data.azurerm_key_vault_secret.spnsecret.value
  kv_id             = local.kv_id
  kv_key            = "${var.pjtcode}${local.shortenv}aks"
}

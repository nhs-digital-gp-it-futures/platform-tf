module "kubernetes" {
  source            = "github.com/nhs-digital-gp-it-futures/platform-tf-modules/bc_kubernetes"

  environment       = var.environment
  region            = var.region
  project           = var.project
  rg_name           = azurerm_resource_group.aks.name
  ag_name_fragment  = "${var.project}-${var.environment}"
  aks_version       = "1.19.7"
  aks_sku_tier      = "Free"
  aks_nodepool      = "monitorpool"
  aks_vmsize        = "Standard_B2ms"
  aks_init_nodes    = 1
  aks_max_nodes     = 2
  aks_min_nodes     = 1
  aks_subnet_id     = azurerm_subnet.aks.id
  subnet_prefix     = var.addrprefix
  aks_dns_prefix    = "${var.project}${var.environment}aksdns"
  ip_rules          = [
    "${data.azurerm_key_vault_secret.bjssvpn.value}/32",
    "${data.azurerm_key_vault_secret.mastekvpn1.value}/32",
    "${data.azurerm_key_vault_secret.mastekvpn2.value}/32",
  ]
  spn_id            = data.azurerm_key_vault_secret.spnappid.value
  spn_secret        = data.azurerm_key_vault_secret.spnsecret.value
  kv_id             = azurerm_key_vault.keyvault.id
  kv_key            = "${local.pjtcode}monaks"
  kube_dashboard    = "false"
}

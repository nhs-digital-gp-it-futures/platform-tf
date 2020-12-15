### RENAMEME
resource "azurerm_key_vault_secret" "kv_aksusernamedev" {
  name         = "${var.pjtcode}${local.shortenv}aksusername"
  value        = azurerm_kubernetes_cluster.aksdev[0].kube_config.0.username
  content_type = "${var.project}-AKS-username"
  key_vault_id = local.kv_id
  
  depends_on = [
    azurerm_kubernetes_cluster.aksdev[0]
  ] 

  tags = {
    environment = var.environment
  }
}

### RENAMEME
resource "azurerm_key_vault_secret" "kv_akspassworddev" {
  name         = "${var.pjtcode}${local.shortenv}akspassword"
  value        = azurerm_kubernetes_cluster.aksdev[0].kube_config.0.password
  content_type = "${var.project}-AKS-password"
  key_vault_id = local.kv_id
  
  depends_on = [
    azurerm_kubernetes_cluster.aksdev[0]
  ] 

  tags = {
    environment = var.environment
  }
}

### RENAMEME
resource "azurerm_key_vault_secret" "kv_aksclientcertdev" {
  name         = "${var.pjtcode}${local.shortenv}aksclientcert"
  value        = azurerm_kubernetes_cluster.aksdev[0].kube_config.0.client_certificate
  content_type = "${var.project}-AKS-client-certificate-(Base64)"
  key_vault_id = local.kv_id
  
  depends_on = [
    azurerm_kubernetes_cluster.aksdev[0]
  ] 

  tags = {
    environment = var.environment
  }
}

### RENAMEME
resource "azurerm_key_vault_secret" "kv_aksclientkeydev" {
  name         = "${var.pjtcode}${local.shortenv}aksclientkey"
  value        = azurerm_kubernetes_cluster.aksdev[0].kube_config.0.client_key
  content_type = "${var.project}-AKS-client-key-(Base64)"
  key_vault_id = local.kv_id
    
  depends_on = [
    azurerm_kubernetes_cluster.aksdev[0]
  ] 

  tags = {
    environment = var.environment
  }
}

### RENAMEME
resource "azurerm_key_vault_secret" "kv_aksclustercacertdev" {
  name         = "${var.pjtcode}${local.shortenv}aksclustercacert"
  value        = azurerm_kubernetes_cluster.aksdev[0].kube_config.0.cluster_ca_certificate
  content_type = "${var.project}-AKS-Cluster-CA-Certificate-(Base64)"
  key_vault_id = local.kv_id
      
  depends_on = [
    azurerm_kubernetes_cluster.aksdev[0]
  ] 
  
  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv_devsa" {
  name         = "${var.pjtcode}${local.shortenv}storageaccountconnectionstring"
  value        = azurerm_storage_account.data_gen[0].primary_connection_string
  content_type = "${var.project}-Connection-String"
  key_vault_id = local.kv_id
  
  tags = {
    environment = var.environment
  }
}

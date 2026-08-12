resource "azurerm_resource_group" "expensy_rg" {
  name     = "expensy-resource-group"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "expensy_aks" {
  name                = "expensy-aks-cluster"
  location            = azurerm_resource_group.expensy_rg.location
  resource_group_name = azurerm_resource_group.expensy_rg.name
  dns_prefix          = "expensy-aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }
}

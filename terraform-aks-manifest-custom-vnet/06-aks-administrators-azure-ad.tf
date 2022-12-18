resource "azuread_group" "aks-administrators" {
  display_name     = "${azurerm_resource_group.aks_rg1.name}-${var.environment}-administrators"
  security_enabled = true
  description      = "Azure AKS Kubernetes administrators for the ${azurerm_resource_group.aks_rg1.name}-cluster."
}
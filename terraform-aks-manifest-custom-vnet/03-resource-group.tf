resource "azurerm_resource_group" "aks_rg1" {
  name     = "${var.resource_group_name}-${var.environment}"
  location = var.location
}
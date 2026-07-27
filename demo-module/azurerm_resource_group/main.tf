resource "azurerm_resource_group" "resource_group" {
  name     = var.azurerm_resource_group
  location = var.location
}
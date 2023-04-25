resource "azurerm_resource_group" "rg" {
  name     = "rg-demo-${var.suffix}"
  location = var.azure_location
}
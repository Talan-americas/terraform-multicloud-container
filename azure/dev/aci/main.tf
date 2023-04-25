resource "azurerm_resource_group" "rg" {
  name     = "rg-demo-${var.suffix}"
  location = var.azure_location
}

resource "azurerm_container_group" "acigroup" {
  name                = "aci-${var.app_name}-${var.suffix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "Public"
  dns_name_label      = "${var.app_name}-container-group"
  os_type             = "Linux"

  image_registry_credential {
    username = var.azure_cr_username
    password = var.azure_cr_password
    server   = var.azure_cr_server
  }

  container {
    name   = "${var.app_name}-container"
    image  = "${var.app_container_image}"
    cpu    = "1.0"
    memory = "1.5"

    ports {
      port     = var.app_port
      protocol = "TCP"
    }
  }
}
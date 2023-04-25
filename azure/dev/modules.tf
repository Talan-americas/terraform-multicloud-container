terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.53.0"
    }
  }
}

provider "azurerm" {
  features {}
}


module "rsg_dev"{
    source         = "../modules/rsg"
    azure_location = var.azure_location
    suffix         = local.suffix
}

module "aci_dev"{
    source              = "../modules/aci"

    azure_location      = module.rsg_dev.resource_group_location
    resource_group_name = module.rsg_dev.resource_group_name
    suffix              = local.suffix
    app_name            = "sb3andjava17"
    app_container_image = "123"
    app_port            = "123"
    azure_cr_username   = "123"
    azure_cr_password   = "123"
    azure_cr_server     = "123"
}
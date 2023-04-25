# Azure provider
provider "azurerm" {
  version = "~> 3.53.0"
  features {}
}

# AWS provider
provider "aws" {
  version = "~> 3.0"
  region  = var.aws_region
}

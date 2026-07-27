terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"

    }
  }
}

provider "azurerm" {
subscription_id = "a6ee36d9-5c99-45ba-991b-d097d0763296"
client_id = "78b5f9d2-765b-4f07-97bb-5823cfc2508e"
tenant_id = "c97e3114-b925-4462-ba52-7e105038dcf2"
  features {

  }
}


module "azurerm_resource_group" {
    source = "./demo-module/azurerm_resource_group"
    azurerm_resource_group = var.azurerm_resource_group_name
    location = var.location
  
}

module "azurerm_virtual_network" {
  depends_on = [ module.azurerm_resource_group ]
  source = "./demo-module/azurerm_virtual_network"
  resource_group_name = var.azurerm_resource_group_name
  location = var.location
  azurerm_virtual_network = var.azurerm_virtual_network
  address_space = var.address_space
  
}

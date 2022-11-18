terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.32.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}


resource "azurerm_resource_group" "appgrp" {
  name     = "app-grp"
  location = "East us"
}

resource "azurerm_virtual_network" "appnetwork" {
  name                = "app-network"
  location            = azurerm_resource_group.appgrp.location
  resource_group_name = azurerm_resource_group.appgrp.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "subnetA"
    address_prefix = "10.0.0.0/24"
  }

  subnet {
    name           = "subnetB"
    address_prefix = "10.0.1.0/24"    
  }
}

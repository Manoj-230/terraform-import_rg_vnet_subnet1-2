terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
    features {}
  
}
resource "azurerm_resource_group" "existing_rg" {
  name     = "practise"
  location = "East US"
}
resource "azurerm_virtual_network" "existing_vnet" {
  name                = "practisevnet"
  location            = azurerm_resource_group.existing_rg.location
  resource_group_name = azurerm_resource_group.existing_rg.name
  address_space       = ["10.0.0.0/16"]
  
}
resource "azurerm_subnet" "existing_subnet" {
  name                 = "practisesubnet"
  resource_group_name  = azurerm_resource_group.existing_rg.name
  virtual_network_name = azurerm_virtual_network.existing_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
resource "azurerm_subnet" "new_subnet" {
  name                 = "practisesubnet1"
  resource_group_name  = azurerm_resource_group.existing_rg.name
  virtual_network_name = azurerm_virtual_network.existing_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

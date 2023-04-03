terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.50.0"
    }
  }
}

provider "azurerm" {
    features{} 
}

resource "azurerm_storage_account" "myStorage" {
  name                     = "mateuscliraforterraform"
  resource_group_name      = "sandbox"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
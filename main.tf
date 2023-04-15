terraform {
  required_providers {
    azurerm   = {
      source  = "hashicorp/azurerm"
      version = "3.50.0"
    }
  }
}

provider "azurerm" {
    features{} 
}

resource "random_string" "random" {
  length  = 10
  special = false
  upper   = false
}

resource "azurerm_storage_account" "myStorage" {
  name                     = "liratech${random_string.random.result}"
  resource_group_name      = "sandbox"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
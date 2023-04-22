terraform {
  backend "azurerm" {
    resource_group_name  = "mateusclira-tfstate"
    storage_account_name = "mateuscliratfstate"
    container_name       = "mateuscliratfstatecourse"
    key                  = "terraformcourse.tfsate"
  }
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
  resource_group_name      = var.RG
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

module "webApp" {
  source    = "./myWebApp"
  RG_WEBAPP = var.RG
  location  = var.location
}

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

resource "azurerm_service_plan" "myServicePlan" {
  name                = "myServicePlan"
  resource_group_name = "sandbox"
  location            = "eastus"
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "myWebApp" {
  name                = "liratech-webapp"
  resource_group_name = "sandbox"
  location            = "eastus"
  service_plan_id     = azurerm_service_plan.myServicePlan.id

  site_config {}
}
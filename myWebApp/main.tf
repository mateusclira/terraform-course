resource "azurerm_service_plan" "myServicePlan" {
  name                = "myServicePlan"
  resource_group_name = var.RG_WEBAPP
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "myWebApp" {
  name                = "liratech-webapp"
  resource_group_name = var.RG_WEBAPP
  location            = var.location
  service_plan_id     = azurerm_service_plan.myServicePlan.id

  site_config {}
}


resource "azurerm_service_plan" "plan" {
  name                = "app-services-api-plan-30268d"
  location            = "Central US"
  resource_group_name = var.resource_group_name

  os_type  = "Linux"
  sku_name = "F1" 
}


resource "azurerm_linux_web_app" "app" {
  name                = "app-services-api-30268d"
  location            = "Central US"
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    always_on = false
    api_definition_url = "https://raw.githubusercontent.com/codeparceorg/api-test-devops/refs/heads/main/openapi-api.yaml"
    
    application_stack {
      docker_image_name = "codeparce/api-test-devops:main"
      docker_registry_url = "https://index.docker.io"
    }
  }

  app_settings = {
    "WEBSITES_PORT" = "8080"
  }
}

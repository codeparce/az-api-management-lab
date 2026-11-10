
# Service Plan (Flex Consumption)
resource "azurerm_service_plan" "asp" {
  name                = "function-api-plan-${var.random_id}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  
  os_type             = "Linux"
  sku_name            = "FC1"
}

# Azure Function App
resource "azurerm_function_app_flex_consumption" "alfa" {
  name                = "function-api-${var.random_id}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  service_plan_id = azurerm_service_plan.asp.id

  // Configuración Storage Account 
  storage_container_type      = "blobContainer"
  storage_container_endpoint  = var.storage_container_url
  storage_authentication_type = "UserAssignedIdentity"
  storage_user_assigned_identity_id = azurerm_user_assigned_identity.identity.id

  // Configuración de instancia
  runtime_name           = "node"
  runtime_version        = "24"
  maximum_instance_count = 40
  instance_memory_in_mb  = 2048

  // Configuración de red
  https_only                = true

  identity {
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.identity.id]
  }

  site_config {

    app_service_logs {
      disk_quota_mb         = 40
      retention_period_days = 10
    }

    minimum_tls_version = "1.2"
  }

  app_settings = {
    "AzureWebJobsStorage"              = ""
    "AzureWebJobsStorage__accountName" = var.storage_account_name
    "AzureWebJobsStorage__credential"  = "managedidentity"
    "AzureWebJobsStorage__clientId"    = azurerm_user_assigned_identity.identity.client_id

    "FUNCTIONS_NODE_BLOCK_ON_ENTRY_POINT_ERROR" = "true"
  }

}

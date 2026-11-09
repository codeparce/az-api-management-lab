resource "azurerm_application_insights" "insights" {
  name                = "function-api-${random_id.suffix.hex}"

  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  workspace_id        = var.azurerm_log_analytics_workspace_id
  application_type    = "Node.JS"
}
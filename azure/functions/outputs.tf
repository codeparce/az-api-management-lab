
output "functionApp-api_url" {
  value = "https://${azurerm_function_app_flex_consumption.alfa.default_hostname}"
}

output "container_app_url" {
  description = "URL pública de la Azure Container App"
  value       = "https://${azurerm_container_app.ca.ingress[0].fqdn}"
}

output "container_app_name" {
  value = azurerm_container_app.ca.name
}

output "container_app_environment_default_domain" {
  value = azurerm_container_app_environment.cae.default_domain
}
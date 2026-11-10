
resource "azurerm_container_app_environment" "cae" {
  name                       = "contappenv-lab-5asd1"
  location                   = var.resource_group_location
  resource_group_name        = var.resource_group_name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  logs_destination = "log-analytics"




  identity {
    type = "SystemAssigned"
    }
}

resource "azurerm_container_app" "ca" {
  name                         = "container-app-2d1as4"
  container_app_environment_id = azurerm_container_app_environment.cae.id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  identity {
    type = "SystemAssigned"
  }

  template {
    container {
      name   = "container-app-2d1as4"
      image  = "codeparce/api-test-devops:main"
      cpu    = 0.25
      memory = "0.5Gi"
    }
    
    min_replicas = 0
    max_replicas = 1
  }

  ingress {
    external_enabled = true
    transport = "auto"
    
    target_port      = 8080

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }
}

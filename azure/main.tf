resource "azurerm_resource_group" "rg" {
  name     = "resources-apim-lab"
  location = "East US"
}


module "funcapp" {
  source                  = "./functions"
  resource_group_location = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name

  storage_account_id    = var.storage_account_id
  storage_account_name  = var.storage_account_name
  storage_container_url = var.storage_container_url
  storage_container_id  = var.storage_container_id

  azurerm_log_analytics_workspace_id = var.log_analytics_workspace_id


  subnet_id = var.subnet_manager_id

}

resource "azurerm_user_assigned_identity" "identity" {
  location            = var.resource_group_location
  name                = "FunctionAppsIdentity"
  resource_group_name = var.resource_group_name
}


# Azure Function Rol
# ------------------------
# STORAGE RBAC
resource "azurerm_role_assignment" "storage_blob" {
  scope                = var.storage_account_id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
  principal_type       = "ServicePrincipal"
}

resource "azurerm_role_assignment" "storage_queue" {
  scope                = var.storage_account_id
  role_definition_name = "Storage Queue Data Contributor"
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
  principal_type       = "ServicePrincipal"
}

resource "azurerm_role_assignment" "storage_table" {
  scope                = var.storage_account_id
  role_definition_name = "Storage Table Data Contributor"
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
  principal_type       = "ServicePrincipal"
}

resource "azurerm_role_assignment" "storage_contrib" {
  scope                = var.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
}

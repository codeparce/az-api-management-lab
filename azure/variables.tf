variable "user_object_id" {
  description = "El Object ID del usuario de Azure AD que será el Officer"
  type        = string
}

variable "storage_account_id" {
  description = "Resource ID del Storage Account usado por la Function App"
  type        = string
}

variable "storage_account_name" {
  description = "Nombre del Storage Account usado por la Function App"
  type        = string
}

variable "storage_container_url" {
  description = "URL del contenedor de blobs usado por la Function App"
  type        = string
}

variable "storage_container_id" {
  description = "Resource ID del contenedor de blobs usado por la Function App"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Resource ID del Log Analytics Workspace para Application Insights"
  type        = string
}

variable "subnet_manager_id" {
  description = "Resource ID de la subnet para la integración de red de la Function App"
  type        = string
}



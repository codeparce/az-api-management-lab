terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "=3.6.3"
    }
  }

}

provider "azurerm" {
  features {
  }
}

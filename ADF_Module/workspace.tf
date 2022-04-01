terraform {
  required_providers {
    azurerm =  "~> 2.33"
    random = "~> 2.2"
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.5.3"
    }
  }
}


data "azurerm_client_config" "current" {
}

data "azurerm_resource_group" "this" {
  name     = "RG0001"  # change the name 
  # location = "East US"
  
}

resource "azurerm_databricks_workspace" "this" {
  name                        = "${var.app}-${var.env}-workspace"
  resource_group_name         = var.rsg_name
  location                    = var.location
  sku                         = "premium"
  managed_resource_group_name = "${var.app}-${var.env}}-workspace-rg"
  tags                        = var.tags
}

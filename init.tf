terraform {
  required_providers {
    azurerm =  "~> 2.33"
    random = "~> 2.2"
    databricks {
        source = "/databrickslabs/databricks"
    }
  }
#   backend "azurerm" {
#     storage_account_name = var.state_storage_account_name
#     container_name = var.state_storage_container_name
#     key = "tst.terraform.tfstate"
#     access_key = var.storagekey
#   }
}

provider "azurerm" {
  features {}
  client_id = var.client_id
  client_secret = var.client_secret
  subscription_id = var.subscription_id
  tenant_id = var.tenant_id
}


  provider "databricks" {
  host = azurerm_databricks_workspace.this.workspace_url
  azure_workspace_resource_id = azurerm_databricks_workspace.this.id
  azure_client_id = var.client_id
  azure_client_secret = var.client_secret
  azure_tenant_id = var.tenant_id

}
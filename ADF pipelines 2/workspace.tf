terraform {
  required_providers {
    azurerm =  "~> 2.33"
    random = "~> 2.2"
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.5.3"
    }
  }
#   backend "azurerm" {
#     storage_account_name = "sreekanth"
#     container_name = "test1"
#     key = "terraform.tfstate"
#     access_key = "26RA9dCiB8pwwd2GxJHDXvEoa2iZbZxrffx0+lAbmQwiIvve6tqPliIeBvNYfmZqAjsjzu3MAf6u+ASt2veWUw=="
# }
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
   azure_client_id = var.client_id # "8db67d23-e28a-4499-9396-92ae78567ec4"
   azure_client_secret = var.client_secret #"pCs7Q~jz4hA4C~cs3GcPSTivB616EuumVO8Yl"
  azure_tenant_id = var.tenant_id #"afd106ce-9134-48c3-b3be-63d51306d4e5"

}
  
variable "region" {
  type = string
  default = "East US"
}

resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 6
}

data "azurerm_client_config" "current" {
}

# data "external" "me" {
#   program = ["az", "account", "show", "--query", "user"]
# }

locals {
  prefix = "databricksdemo${random_string.naming.result}"
  tags = {
    Environment = "Demo"
    Owner       = "sreekanth"
  }
}

resource "azurerm_resource_group" "this" {
  name     = "${local.prefix}-rg"
  location = var.region
  tags     = local.tags
}

data "azurerm_resource_group" "this" {
  name     = "RG0001"  # change the name 
  # location = "East US"
  
}

resource "azurerm_databricks_workspace" "this" {
  name                        = "${local.prefix}-workspace"
  resource_group_name         = data.azurerm_resource_group.this.name
  location                    = azurerm_resource_group.this.location
  sku                         = "premium"
  managed_resource_group_name = "${local.prefix}-workspace-rg"
  tags                        = local.tags
}

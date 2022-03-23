resource "azurerm_resource_group" "adls-rg" {
  name     = "adls-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "adlsstorageaccountname"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled   = true 
}

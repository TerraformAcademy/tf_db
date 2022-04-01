output "workspace" {
  value       = azurerm_data_bricks_workspace.this
  
  description = "All atrributes of Data Bricks Workspace"

}


output "cluster" {
    value = databricks_cluster.this
}
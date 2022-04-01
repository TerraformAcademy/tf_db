data "databricks_node_type" "smallest" {
  local_disk = true
  depends_on = [azurerm_databricks_workspace.this]
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
  depends_on = [azurerm_databricks_workspace.this]
}

resource "databricks_cluster" "this" {
  cluster_name            = "${var.app}-${var.env}-cluster"
  spark_version           = data.databricks_spark_version.latest_lts.id
  node_type_id            = data.databricks_node_type.smallest.id
  autotermination_minutes = 15
  autoscale {
    min_workers = 1
    max_workers = 3
  }
}
`
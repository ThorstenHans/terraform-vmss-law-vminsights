resource "azurerm_log_analytics_solution" "vminsights" {
  resource_group_name = var.rg_name
  location            = var.location
  solution_name       = "VMInsights"

  workspace_resource_id = azurerm_log_analytics_workspace.law.id
  workspace_name        = azurerm_log_analytics_workspace.law.name

  plan {
    product   = "OMSGallery/VMInsights"
    publisher = "Microsoft"
  }
}

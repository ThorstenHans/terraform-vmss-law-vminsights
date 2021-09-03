resource "azurerm_log_analytics_workspace" "law" {
  resource_group_name = var.rg_name
  location            = var.location
  name                = "law-vmss-sample"

  sku = "PerGB2018"
}

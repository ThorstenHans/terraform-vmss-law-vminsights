resource "azurerm_virtual_machine_scale_set_extension" "vmss_ext_mma" {
  virtual_machine_scale_set_id = azurerm_windows_virtual_machine_scale_set.vmss.id
  auto_upgrade_minor_version   = true
  name                         = "MicrosoftMonitoringAgent"
  publisher                    = "Microsoft.EnterpriseCloud.Monitoring"
  type                         = "MicrosoftMonitoringAgent"
  type_handler_version         = "1.0"

  protected_settings = jsonencode({
    "workspaceKey" = "${azurerm_log_analytics_workspace.law.primary_shared_key}"
  })

  settings = jsonencode({
    "workspaceId"               = "${azurerm_log_analytics_workspace.law.workspace_id}",
    "stopOnMultipleConnections" = true
  })
}

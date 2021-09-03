resource "azurerm_virtual_machine_scale_set_extension" "vmss_ext_da" {
  virtual_machine_scale_set_id = azurerm_windows_virtual_machine_scale_set.vmss.id
  auto_upgrade_minor_version   = true
  name                         = "DependencyAgentWindows"
  publisher                    = "Microsoft.Azure.Monitoring.DependencyAgent"
  type                         = "DependencyAgentWindows"
  type_handler_version         = "9.10"
  provision_after_extensions   = [azurerm_virtual_machine_scale_set_extension.vmss_ext_mma.name]

  settings = jsonencode({
    "enableAutomaticUpgrade" = true
  })
}

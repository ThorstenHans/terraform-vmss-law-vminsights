resource "azurerm_windows_virtual_machine_scale_set" "vmss" {
  resource_group_name = var.rg_name
  location            = var.location
  name                = "vmss-sample"

  admin_username       = var.vmss_admin_user
  admin_password       = var.vmss_admin_password
  computer_name_prefix = "thns"
  instances            = var.vmss_instances
  license_type         = "Windows_Server"
  sku                  = var.vmss_sku

  provision_vm_agent     = true
  single_placement_group = true
  timezone               = var.vmss_timezone
  upgrade_mode           = "Automatic"


  identity {
    type = "SystemAssigned"
  }

  source_image_reference {
    publisher = var.vmss_source_image_publisher
    offer     = var.vmss_source_image_offer
    sku       = var.vmss_source_image_sku
    version   = var.vmss_source_image_version
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "nic_default"
    primary = true

    ip_configuration {
      name                                   = "ip_default"
      primary                                = true
      subnet_id                              = azurerm_subnet.internal.id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.be_pool.id]
    }
  }

  tags = var.tags

}

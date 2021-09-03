resource "azurerm_virtual_network" "vnet" {
  resource_group_name = var.rg_name
  location            = var.location
  name                = "vnet-vmss-sample"

  address_space = [var.address_space_vnet]
}

resource "azurerm_subnet" "internal" {
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  name                 = "sn-internal"

  address_prefixes = [var.address_space_vmss_subnet]
}

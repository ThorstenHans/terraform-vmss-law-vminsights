resource "azurerm_public_ip" "pip_outbound" {
  resource_group_name = var.rg_name
  location            = var.location
  name                = "pip-vmss-outbound"

  allocation_method = "Static"
  sku               = "Standard"
}

resource "azurerm_nat_gateway" "nat_vmms_outbound" {
  resource_group_name = var.rg_name
  location            = var.location
  name                = "nat-vmss-outbound"

  idle_timeout_in_minutes = 15
  sku_name                = "Standard"
}

resource "azurerm_nat_gateway_public_ip_association" "nat_pip" {
  nat_gateway_id       = azurerm_nat_gateway.nat_vmms_outbound.id
  public_ip_address_id = azurerm_public_ip.pip_outbound.id
}

resource "azurerm_subnet_nat_gateway_association" "nat_vmss_subnet" {
  nat_gateway_id = azurerm_nat_gateway.nat_vmms_outbound.id
  subnet_id      = azurerm_subnet.internal.id
}

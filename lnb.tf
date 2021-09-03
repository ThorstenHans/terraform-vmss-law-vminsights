resource "azurerm_lb" "lnb_int" {
  resource_group_name = var.rg_name
  location            = var.location
  name                = "lbint-vmss-sample"

  sku  = "Standard"
  tags = var.tags

  frontend_ip_configuration {
    name                          = "lbint-frontend-vmss-sample"
    public_ip_address_id          = null
    private_ip_address_allocation = "Dynamic"
    private_ip_address_version    = "IPv4"
    subnet_id                     = azurerm_subnet.internal.id
  }
}

resource "azurerm_lb_backend_address_pool" "be_pool" {
  name            = "be-vmss-sample"
  loadbalancer_id = azurerm_lb.lnb_int.id
}

resource "azurerm_lb_probe" "lnb_probe" {
  resource_group_name = var.rg_name
  loadbalancer_id     = azurerm_lb.lnb_int.id
  name                = "probe-vmss-sample"

  interval_in_seconds = 30
  number_of_probes    = 2
  port                = 8443
}

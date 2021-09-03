resource "azurerm_lb_rule" "lnb_rule" {
  resource_group_name = var.rg_name
  loadbalancer_id     = azurerm_lb.lnb_int.id
  probe_id            = azurerm_lb_probe.lnb_probe.id
  name                = "rule-8443"

  backend_address_pool_id        = azurerm_lb_backend_address_pool.be_pool.id
  backend_port                   = 8443
  frontend_ip_configuration_name = "lbint-frontend-vmss-sample"
  frontend_port                  = 8443
  protocol                       = "Tcp"
}

resource "azurerm_public" "load_balancer_ip" {
  name                = "lb-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku = "Standard"
}
resource "azurerm_lb" "appbalancer" {
  name                = "app-balancer"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku = "Standard"
  sku_tier = "Regional"
  frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = azurerm_public.load_balancer_ip.id
  }
}
resource "azurerm_lb_backend_address_pool" "virtual_machine_pool" {
  name                = "vm-backend-pool"
  loadbalancer_id     = azurerm_lb.appbalancer.id
}
resource "azurerm_lb_probe" "probeA" {
  name                = "probeA"
  loadbalancer_id     = azurerm_lb.appbalancer.id
  protocol            = "Tcp"
  port                = 80
}

resource "azurerm_lb_backend_address_pool_address" "appvmaddress" {
  count               = var.number_of_machines
  name                = "machine${count.index}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.virtual_machine_pool.id
  // We need the network id and the private IP address of each network interface
  virtual_network_id      = var.virtual_network_id
  ip_address         = var.network_interface_private_ip_address[count.index]
}

resource "azurerm_lb_rule" "RuleA" {
    name                           = "http-rule"
    loadbalancer_id                = azurerm_lb.appbalancer.id
    protocol                       = "Tcp"
    frontend_port                  = 80
    backend_port                   = 80
    frontend_ip_configuration_name = "frontend-ip"
    backend_address_pool_ids       = azurerm_lb_backend_address_pool.virtual_machine_pool.id
    probe_id                       = azurerm_lb_probe.probeA.id
}
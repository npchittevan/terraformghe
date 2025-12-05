resource "azurerm-virtual_network" "virtual-network" {
  name                = var.vnet_name
  address_space       = [var.vnet_address_prefix]
  location            = var.location
  resource_group_name = var.resource_group_name
}
resource "azurerm_subnet" "network_subnet" {
  count               = var.vnet_subnet_count
  name                = "subnet-${count.index}"
  resource_group_name = var.resource_group_name
  virtual_network_name= azurerm-virtual_network.virtual-network.name
  address_prefixes    = [cidrsubnet((var.vnet_address_prefix),8,count.index)]
 }
resource "azurerm_virtual_network" "virtual-network" {
  name                = var.vnet_name
  address_space       = [var.vnet_address_prefix]
  location            = var.location
  resource_group_name = var.resource_group_name
}
resource "azurerm_subnet" "network_subnet" {
  count               = var.vnet_subnet_count
  name                = "subnet-${count.index}"
  resource_group_name = var.resource_group_name
  virtual_network_name= azurerm_virtual_network.virtual-network.name
  address_prefixes    = [cidrsubnet((var.vnet_address_prefix),8,count.index)]
 }
resource "azurerm_public_ip" "public_ipaddress" {
  count = var.public_ipaddress_count
  name                = "public-ip-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}
resource "azurerm_network_interface" "network_interface" {
  count = var.network_interface_count
  name                = "network-interface-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.network_subnet[count.index].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ipaddress[count.index].id
  }
  
}
resource "azurerm_network_security_group" "network_security_group" {
  name                = "network-security-group"
  location            = var.location 
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = toset(var.network_security_group_rules)
    content {
      name                       = "Allow-${security_rule.value.destination_port_range}"
      priority                   = network_security_group_rules.value.priority      
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = network_security_group_rules.value.destination_port_range
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    
  }
}
resource "azurerm_subnet_network_security_group_association" "subnet_nsg_association" {
  count = var.vnet_subnet_count
  subnet_id                 = azurerm_subnet.network_subnet[count.index].id
  network_security_group_id = azrerm_network_security_group.network_security_group.id  
}
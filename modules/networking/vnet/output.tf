output "virtual_network_interface_ids" {
  value = azurerm_network_interface.network_interface[*].id
}

output "virtual_network_id" {
  value = azurerm_virtual_network.virtual-network.id
}

output "network_interface_private_ip_address" {
  value = azurerm_network_interface.network_interface[*].private_ip_address
}
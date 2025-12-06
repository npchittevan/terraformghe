output "virtual_network_interface_ids" {
  value = azurerm_network_interface.network_interface[*].id
}

output "public_ip_address" {
  value = azurerm_public_ip.public_ipaddress[*].id.ip_address
}

output "virtual_network_id" {
  value = azurerm_virtual_network.virtual-network.id
}

output "network_interface_private_ip_address" {
  value = azurerm_network_interface.network_interface[*].private_ip_address
}
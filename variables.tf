variable "resource_group_name" {
    type=string
    description="name of the resource group"
}
variable "location" {
    type=string
    description="location of the resource group"
}
variable "vnet_name" {
    type=string
    description="name of the virtual network"
}
variable "vnet_address_prefix" {
  type = string
  description = "This defines the address prefix of the virtual network"
}
variable "vnet_subnet_count" {
  type = number
  description = "This defines number of subnets"
}
variable "public_ipaddress_count" {
  type = number
  description = "This defines number of subnets"
}
variable "network_interface_count" {
  type = number
  description = "This defines number of subnets"
}
variable "network_security_group_rules" {
  type = list(object({
    #name                       = string
    priority                   = number
    #direction                  = string
    #access                     = string
    #protocol                   = string
    #source_port_range          = string
    destination_port_range     = string
    #source_address_prefix      = string
    #destination_address_prefix = string
  }))
  description = "List of network security group rules"
  
}
variable "virtual_machine_count" {
  type        = number
  description = "Number of virtual machines to create"  
}
variable "virtual_network_interface_ids" {
    type=list(string)
    description = "This will hold the virtual network interfaces ids"
}
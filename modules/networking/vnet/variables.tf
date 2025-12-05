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


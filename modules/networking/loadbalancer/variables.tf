variable "resource_group_name" {
    type=string
    description="name of the resource group"
}
variable "location" {
    type=string
    description="location of the resource group"
}
variable "virtual_machine_count" {
  type        = number
  description = "Number of virtual machines to create"  
}
variable "number_of_machines" {
  type = number
}
variable "network_interface_private_ip_address" {
  type=list(string) 
  description = "This is the private IP addresses of the network interfaces attached to the virtual machines"
}
variable "virtual_network_id" {
  type = string
  description = "This is the ID of the virtual network"
}
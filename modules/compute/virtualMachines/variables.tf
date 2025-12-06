variable "virtual_machine_count" {
  type        = number
  description = "Number of virtual machines to create"  
}
variable "resource_group_name" {
    type=string
    description="name of the resource group"
}
variable "location" {
    type=string
    description="location of the resource group"
}
variable "virtual_network_interface_ids" {
    type=list(string)
    description = "This will hold the virtual network interfaces ids"
}
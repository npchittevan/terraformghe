
module "resource-group" {
  source = "./modules/general/resourcegroup"  
  resource_group_name = var.resource_group_name
  location            = var.location
}
module "virtual_network" {
  source="./modules/networking/vnet"
  vnet_subnet_count = var.vnet_subnet_count
  resource_group_name=var.resource_group_name
  location=var.location
  vnet_name=var.vnet_name
  vnet_address_prefix=var.vnet_address_prefix
  public_ipaddress_count = var.public_ipaddress_count
  network_interface_count = var.network_interface_count
  network_security_group_rules = var.network_security_group_rules
  depends_on = [ module.resource-group ]
}
module "machines" {
  source = "./modules/compute/virtualMachines"
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_machine_count = var.virtual_machine_count
  virtual_network_interface_ids = module.virtual_network.virtual_network_interface_ids
  depends_on = [ module.virtual_network ]
}

module "load-balancer" {
    source = "./modules/networking/loadbalancer"
    resource_group_name = var.resource_group_name
    location = var.location
    virtual_machine_count = var.virtual_machine_count
    number_of_machines = var.virtual_machine_count
    virtual_network_id = module.virtual_network.virtual_network_id
    network_interface_private_ip_address = module.virtual_network.network_interface_private_ip_address
    depends_on = [ module.machines ]
}
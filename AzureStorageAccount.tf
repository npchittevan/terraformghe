
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
  depends_on = [ module.resource-group ]
}
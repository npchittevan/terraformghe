resource_group_name = "app-grp01"
location            = "Central India"
vnet_name          = "app-vnet01"
vnet_address_prefix = "10.0.0.0/16"
vnet_subnet_count   = 2
public_ipaddress_count = 2
network_interface_count = 2
network_security_group_rules = [
  {
    priority               = 300
    destination_port_range = "22"
  },
  {
    priority               = 310
    destination_port_range = "80"
  }
]
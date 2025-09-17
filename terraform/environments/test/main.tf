module "resource_group" {
  source              = "../../modules/resource_group"
  resource_group_name = module.resource_group.rg_name     # "${var.resource_group_name}"
  location            = module.resource_group.rg_location # "${var.location}"
}
module "network" {
  source               = "../../modules/network"
  address_space        = var.address_space
  location             = var.location
  virtual_network_name = var.virtual_network_name
  application_type     = var.application_type
  resource_type        = "NET"
  resource_group_name  = module.resource_group.rg_name
  address_prefix_test  = var.address_prefix_test
}

module "nsg-test" {
  source              = "../../modules/networksecuritygroup"
  location            = var.location
  application_type    = var.application_type
  resource_type       = "NSG"
  resource_group_name = module.resource_group.rg_name
  subnet_id           = module.network.subnet_id_test
  address_prefix_test = var.address_prefix_test
}

module "appservice" {
  source              = "../../modules/appservice"
  location            = var.location
  application_type    = var.application_type
  resource_type       = "AppService"
  resource_group_name = module.resource_group.rg_name # "${var.resource_group_name}"
}

module "publicip" {
  source              = "../../modules/publicip"
  location            = var.location
  application_type    = var.application_type
  resource_type       = "public_ip_adress"
  resource_group_name = module.resource_group.rg_name
}


module "vm" {
  source              = "../../modules/vm"
  location            = var.location
  application_type    = var.application_type
  resource_type       = "VM"
  resource_group_name = module.resource_group.rg_name
  subnet_id           = module.network.subnet_id_test
  public_ip_address_id = module.publicip.public_ip_address_id
}
output "resource_group_name" {
  value = module.resource_group.rg_name
}

output "resource_group_location" {
  value = module.resource_group.rg_location
}


output "subnet_id_test" {
  value = module.network.subnet_id_test
}
output "nsg_ids" {
  value = module.nsg-test.nsg_id
}

output "appservice_name" {
  value = module.appservice.azurerm_service_plan_name
}
output "public_ip_address_id" {
  value = module.publicip.public_ip_address_id
}
output "vm_name" {
  value = module.vm.vm-name
}
output "nic_name" {
  value = module.vm.nic-name
}
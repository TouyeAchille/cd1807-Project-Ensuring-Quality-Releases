output "rg_name" {
  value = "${data.azurerm_resource_group.test.name}"
}
output "rg_location" {
  value = "${data.azurerm_resource_group.test.location}"
}

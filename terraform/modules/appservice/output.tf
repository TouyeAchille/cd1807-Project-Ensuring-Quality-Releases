output "resource_group_name" {
  value = "${var.resource_group_name}"
}

output azurerm_linux_web_app_name {
  value = "${azurerm_linux_web_app.test.name}"
}

output "azurerm_service_plan_name" {
  value = "${azurerm_service_plan.test.name}"
}

output "resource_type" {
  value = "${var.resource_type}"
}

output "application_type" {
  value = "${var.application_type}"
}
output "location" {
  value = "${var.location}"
}

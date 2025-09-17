output vm-name {
  value = "${azurerm_linux_virtual_machine.test.name}"
}
output nic-name {
  value = "${azurerm_network_interface.nic.name}"
}   
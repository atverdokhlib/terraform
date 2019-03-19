data "azurerm_public_ip" "test" {
  name                = "${azurerm_public_ip.pub-ip.name}"
  resource_group_name = "${azurerm_virtual_machine.vm.resource_group_name}"
}

output "public_ip_address" {
  value = "${data.azurerm_public_ip.test.ip_address}"
}


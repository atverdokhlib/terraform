resource "azurerm_virtual_machine" "vm" {
  name                  = "${var.prefix}-vm"
  location              = "${azurerm_resource_group.rsg-westeu.location}"
  resource_group_name   = "${azurerm_resource_group.rsg-westeu.name}"
  network_interface_ids = ["${azurerm_network_interface.nic.id}"]
  vm_size               = "${var.sku}"
  
  
 storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
 storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
 storage_data_disk {
    name              = "datadisk_ssd"
    managed_disk_type = "StandardSSD_LRS"
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = "10"
  }

 storage_data_disk {
    name              = "datadisk_hdd"
    managed_disk_type = "Standard_LRS"
    create_option     = "Empty"
    lun               = 1
    disk_size_gb      = "10"
  }

   os_profile {
    computer_name  = "hostname"
    admin_username = "andy"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
    

  tags = {
    environment = "stg"
  }
   

  #depends_on = ["azurerm_virtual_machine_extension.test"]
}
#resource "azurerm_network_watcher" "test" {
# name                = "network-watcher"
#  location            = "${azurerm_resource_group.rsg-westeu.location}"
#  resource_group_name = "${azurerm_resource_group.rsg-westeu.name}"
#}
resource "azurerm_virtual_network" "westeu-network" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.rsg-westeu.location}"
  resource_group_name = "${azurerm_resource_group.rsg-westeu.name}"
   tags = {
     environment = "terraform"
  }
}
resource "azurerm_subnet" "management-subnet" {
  name                 = "${var.prefix}-mng-subnet"
  resource_group_name  = "${azurerm_resource_group.rsg-westeu.name}"
  virtual_network_name = "${azurerm_virtual_network.westeu-network.name}"
  address_prefix       = "10.0.1.0/24"
   
   
}
resource "azurerm_public_ip" "pub-ip" {
  name                    = "test-pip"
  location                = "${azurerm_resource_group.rsg-westeu.location}"
  resource_group_name     = "${azurerm_resource_group.rsg-westeu.name}"
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30

  tags = {
    environment = "test-pip"
  }
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.prefix}-nic"
  location            = "${azurerm_resource_group.rsg-westeu.location}"
  resource_group_name = "${azurerm_resource_group.rsg-westeu.name}"

  ip_configuration {
    name                          = "terraform-test-nic-ip"
    subnet_id                     = "${azurerm_subnet.management-subnet.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.pub-ip.id}"
    
  }
  
}
   


resource "azurerm_resource_group" "rsg-westeu" {
  name     = "${var.prefix}-rsg-westeu"
  location = "${var.region}"

  tags = {
    environment = "Production"
  }
}
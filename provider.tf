# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.22.0"
  subscription_id = "d587856f-5eca-4199-b173-37634f44867d"
  tenant_id       = "a4df60bd-8703-453a-9300-8fff26941972"  
}
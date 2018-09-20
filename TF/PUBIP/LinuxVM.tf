provider "azurerm" { }


data "azurerm_network_interface" "main" {
  name                      = "${var.networkInterfaceName}"
  resource_group_name       = "${var.resource_group}"
  }

output "example" {
  value = "${data.azurerm_network_interface.main.id}"
}

# Create a Public IP for the Virtual Machine
resource "azurerm_public_ip" "main" {
  name                         = "${data.azurerm_network_interface.main.id}"
  location                     = "${var.location}"
  resource_group_name          = "${var.resource_group}"
  public_ip_address_allocation = "${var.publicIpAddressType}"
}

output "AzurePublicIP" {
  value = "${azurerm_public_ip.main.ip_address}"
}

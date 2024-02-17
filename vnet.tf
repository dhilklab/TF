# Create a new virtual network
resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet1"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"  # Replace with your desired region
  resource_group_name = data.azurerm_resource_group.name
}

# Create a subnet within the virtual network
resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  virtual_network_name = azurerm_virtual_network.my_vnet.name
  resource_group_name  = azurerm_virtual_network.my_vnet.resource_group_name
  address_prefixes     = ["10.0.1.0/24"]
}
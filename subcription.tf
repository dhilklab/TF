

# Define an enrollment account scope (replace with your actual account details)
data "azurerm_billing_enrollment_account_scope" "lab02" {
  billing_account_name    = "Senthilkumar Annamalai"
  enrollment_account_name = "Senthilkumar Annamalai"
}

# Create a new subscription with an alias
resource "azurerm_subscription" "lab02" {
  subscription_name = "lab02"
  billing_scope_id  = data.azurerm_billing_enrollment_account_scope.lab02.id
}

# Define your Azure subscription ID (replace with your actual subscription ID)
provider "azurerm" {
  features {}
  subscription_id = data.azurerm_subscription.subscription_id
}

# Create an Azure resource group
resource "azurerm_resource_group" "my_rg" {
  name     = "RG-NETWORK"
  location = "East US"  # Replace with your desired region
}

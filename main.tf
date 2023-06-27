provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "taco-truck"
  location = var.azure_region
  #tags = { environment = "dev" }
}

resource "azurerm_container_group" "main" {
  name                = "taco-truck-app"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  ip_address_type     = "Public"
  os_type             = "Linux"

  container {
    name   = "truck-app"
    image  = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}

variable "azure_region" {
  type        = string
  description = "Azure region to use for resources. Defaults to eastus"
  default     = "eastus"
}

output "public_ip_address" {
  value       = azurerm_container_group.main.ip_address
  description = "Public IP address of the container instance."
}

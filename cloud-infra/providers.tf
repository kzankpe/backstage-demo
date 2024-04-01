terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.97.1"
    }
    azurecaf = {
      source = "aztfmod/azurecaf"
      version = "=1.2.28"
    }
  }
  backend "azurerm" {

  }
}

provider "azurerm" {
  features {
  }
  skip_provider_registration = true
  use_msi                    = true

}
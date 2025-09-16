terraform {
  required_version = ">=v1.13.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.44.0"
    }
  }

  backend "azurerm" {
    storage_account_name = "tfstate2278510369"
    container_name       = "tfstate"
    key                  = "test.terraform.tfstate"
    access_key           = ""
  }
}
terraform {
  required_version = ">=v1.13.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.44.0"
    }
  }

  backend "azurerm" {
    storage_account_name = "tfstate184604487"
    container_name       = "tfstate"
    key                  = "test.terraform.tfstate"
    #use_azuread_auth = true
    # access_key="fill in your access key here via env variable or directly"     
  }
}
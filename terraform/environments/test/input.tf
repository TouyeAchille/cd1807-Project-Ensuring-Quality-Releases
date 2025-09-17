# Azure GUIDS
#variable "subscription_id" {}
#variable "client_id" {}
#variable "client_secret" {}
#variable "tenant_id" {}

# Resource Group/Location
variable "location" {
  type        = string
  description = "Azure location where resources will be created"

}
variable "resource_group_name" {
  type        = string
  description = "value of existing resource group name"
  #11default = "Azuredevops"
}
variable "application_type" {
  type        = string
  description = "Type of application to be deployed"

}

# Network   
variable "virtual_network_name" {
  type        = string
  description = "Name of the Virtual Network"
}
variable "address_prefix_test" {
  type        = list(string)
  description = "The address prefix to use for the subnet."
}
variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
}


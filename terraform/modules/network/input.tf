# Resource Group
variable resource_group_name {
    type = string
    description = "value of existing resource group name"
}
variable location {
    type = string
    description = "Azure location where resources will be created"
}
# Network
variable virtual_network_name {
    type = string
    description = "Name of the Virtual Network"
}
variable address_space {
    type = list(string)
    description = "The address space that is used by the virtual network."
}
variable "application_type" {
    type = string
    description = "Type of application to be deployed"
}
variable "resource_type" {
    type = string
    description = "Type of resource to be created"
}
variable "address_prefix_test" {
    type = list(string)
    description = "The address prefix to use for the subnet."

}


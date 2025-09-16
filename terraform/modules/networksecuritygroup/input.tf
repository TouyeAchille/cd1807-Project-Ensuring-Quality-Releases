# Resource Group/Location
variable "location" {
    type = string
    description = "Azure location where resources will be created"
}
variable "application_type" {
    type = string
    description = "Type of application to be deployed"
}
variable "resource_type" {
    type = string
    description = "Type of resource to be created"
}
variable "resource_group_name" {
    type=string
    description="value of existing resource group name"
}
variable "subnet_id" {
    type=string
    description="The ID of the Subnet"
}
variable "address_prefix_test" {
    type = list(string)
    description = "The address prefix to use for the subnet."
}

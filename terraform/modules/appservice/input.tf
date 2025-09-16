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

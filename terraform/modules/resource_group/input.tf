# Resource Group
variable location {
    type = string
    description = "Azure location where resources will be created"
}
variable "resource_group_name" {
    type = string
    description = "value of existing resource group name"
}
variable "system" {
    type = string
    description = "Name of the system or environment"
}
variable "name" {
    type = string
    description = "Name of the Front Door"
}
variable "location" {
    type = string
    description = "Azure location of terraform server environment"
    default = "westus2"
}
variable "header" {
    type = string
    description = "Azure Front Door header defination"
}
variable "rulename" {
    type = string
    description = "Azure Front Door Routing Rule "
}
variable "frontend" {
    type = string
    description = "Azure Front Door Front End name"
}
variable "backend" {
    type = string
    description = "Azure Front Door Backend name"
}
variable "HealthProbeSetting" {
    type = string
    description = "Azure Front Door Health Probe Setting"
}
variable "BackendSetting" {
    type = string
    description = "Azure Front Door Backend Setting"
}

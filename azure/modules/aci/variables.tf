# Define variables for Azure Container Instance
variable "azure_location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "resource_group_name"{
  type = string
}

variable "suffix" {
  description = "suffix to the end each resource name"
  type        = string
}

variable "app_name" {
  description = "The application name to be deploy"
  type        = string
}

variable "app_container_image" {
  description = "The container image path of the application"
  type        = string
}

variable "app_port" {
  description = "The application port"
  type        = string
}

variable "azure_cr_username" {
  description = "The private container registry username"
  type        = string
}

variable "azure_cr_password" {
  description = "The private container registry password"
  type        = string
}

variable "azure_cr_server" {
  description = "The private container registry server"
  type        = string
}


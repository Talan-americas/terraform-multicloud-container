# Define variables for AWS and Azure resources
variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
}

variable "azure_location" {
  description = "The Azure location where resources will be created"
  type        = string
}

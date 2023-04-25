# Define variables for AWS and Azure resources
variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "azure_location" {
  description = "The Azure location where resources will be created"
  type        = string
  default     = "eastus"
}

variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
}

locals {
   suffix = "dev"
}
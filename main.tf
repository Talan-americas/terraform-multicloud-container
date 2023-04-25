terraform {
  required_version = ">= 0.14"
}

# Include Azure and AWS resources
module "azure_resources"{
    source = "./azure/dev"
    azure_location = var.azure_location
}

module "aws_resources"{
    source = "./aws/dev"
    aws_region = var.aws_region
}
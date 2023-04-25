terraform {
  required_version = ">= 0.14"
}

# Include Azure and AWS resources
module "azure_resources"{
    source = "./azure"
    azure_location = var.azure_location
}

module "aws_resources"{
    source = "./aws"
    aws_region = var.aws_region
}
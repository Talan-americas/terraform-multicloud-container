# Terraform Multi-Cloud structure
This sample show how organize terraform folders and files for provisioning multi-cloud infrastructure which involves creating a directory structure that supports modularization and scalability.

This structure also allow to deploy cloud infrastructure for multiples environments like  dev, qa and prod.

This repository will have only cloud container resources in order to provide infrastructure for a containerized application.

Terraform configuration is organized to provisions infrastructure for AWS and Azure:
```
├── main.tf
├── variables.tf
├── providers.tf
├── azure
│   ├── dev
│   │   ├── modules.tf
│   │   └── variables.tf
│   ├── test
│   ├── prod
│   │   ├── modules.tf
│   │   └── variables.tf
│   └── modules
│       ├── aci
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   └── variables.tf
│       ├── acr
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   └── variables.tf
│       └── rsg
│           ├── main.tf
│           ├── outputs.tf
│           └── variables.tf
├── aws
│   ├── dev
│   ├── test
│   ├── prod
│   │   ├── modules.tf
│   │   └── variables.tf
│   └── modules
```

In this example, the `main.tf`, `providers.tf`, and `variables.tf` files contains the root module, which defines the providers and any global configuration.

Within the `azure` directory, there are subdirectories for each environment (`dev`, `test`, and `prod`). At the same level there a directory called modules that contains modules for different Azure resources, such as ACR container registry, ACI Container Instance, and RG resources group.

Similarly, within the `aws` directory, there are subdirectories for each environment, with modules for AWS resources.

## Provisioning AWS and Azure cloud resources
To provision AWS resources and Azure resources in same terraform command, we must follow these steps: 
1.   First, you must be in root directory and initialize the terraform working directory.
```
terraform init
```
2.  Next, you can execute static analysis to check code for syntactic and structural issues
```
terraform validate
```
3. Use `terraform plan` to preview the changes that terraform will make
```
terraform plan -var "aws_region=us-east-1" -var "azure_location=eastus"
```
Note that `aws_region` and `azure_location` variables can be provided as env variables or pipeline variables within CI/CD pipeline

4. Create the infrastructure using `terraform apply`
```
terraform apply -var "aws_region=us-east-1" -var "azure_location=eastus"
```
5. Destroy the infrastructure created before using `terraform destroy`
```
terraform destroy -var "aws_region=us-east-1" -var "azure_location=eastus"
```

By default root directory will provision the configuration state defined for `dev` environment.

## Provisioning Azure cloud resources for specific environment.
Below terraform commands provision only Azure resources using the folder structure:
1. First, go to the `azure/dev` directory
```
cd azure/dev
```
2. Then, initialize terraform working directory and download provider and modules required.
```
terraform init
```
3. Then, use `terraform plan` to preview the changes that terraform will make
```
terraform plan -var "azure_location=eastus"
```
4. Create the infrastructure using `terraform apply`
```
terraform apply -var "azure_location=eastus"
```
5. Destroy the infrastructure created before using `terraform destroy`
```
terraform destroy -var "azure_location=eastus"
```

Similarly, you can use the `aws` directory, to provisioning AWS resources for a specific environment.

# Provisioning Azure and AWS resources for a specific environment using Github Actions
You can decide which cloud provider to execute through environment variables within GitHub Actions:

1. Define the environment variables in GitHub repository's settings.
    - environment variable named `CLOUD_PROVIDER` with the value `aws` or `azure`.
    - environment variable named `CLOUD_ENV` with the value `dev` or `test` or `prod`.

2. In GitHub Actions workflow file, use the `${{ env.CLOUD_PROVIDER }}` syntax to reference the value of the `CLOUD_PROVIDER` environment variable and `${{ env.CLOUD_ENV }}` to reference the value of `CLOUD_ENV`.

2. Use a conditional statement in your workflow file to decide which cloud provider and which cloud environment to provision the infrastructure:
```
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
      - name: Deploy infrastructure
        run: |
          if [ "${{ env.CLOUD_PROVIDER }}" = "aws" ]; then
            cd aws/${{ env.CLOUD_ENV }}
            terraform apply -var "aws_region=us-east-1"
          elif [ "${{ env.CLOUD_PROVIDER }}" = "azure" ]; then
            cd azure/${{ env.CLOUD_ENV }}
            terraform apply -var "azure_location=eastus"
          fi
```
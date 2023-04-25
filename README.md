# terraform-multicloud-container
This code repository have a terraform structure to deploy cloud infrastructure using multiple cloud provider over multiples environments.
Sample will have only cloud container resources in order to provide infrastructure for a containerized application.

Terraform configuration that provisions infrastructure in AWS and Azure:
```
├── main.tf
├── variables.tf
├── providers.tf
├── aws
│   ├── dev
│   │   ├── ec2
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   └── outputs.tf
│   │   ├── s3
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   └── outputs.tf
│   │   ├── rds
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   └── outputs.tf
│   ├── test
│   │   ├── ec2
│   │   ├── s3
│   │   └── rds
│   ├── prod
│   │   ├── ec2
│   │   ├── s3
│   │   └── rds
├── azure
│   ├── dev
│   ├── test
│   ├── prod
```


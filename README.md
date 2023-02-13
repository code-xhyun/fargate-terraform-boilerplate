# fargate-terraform-boilerplate

This is a Terraform boilerplate for setting up an AWS Fargate cluster with a subdomain configuration in Route53. The purpose of this project is to provide a starting point for anyone looking to launch a Fargate service with subdomains.

## Features
- Fargate cluster
- ECR
- Task definition
- Service
- Load balancer
- Subdomain configuration in Route53
- Etc
The configuration is designed to be easily customizable and extensible, allowing you to build on top of it to fit your specific needs.

## Prerequisites
- AWS Account
- Terraform installed
- AWS CLI


## Getting started

1. Clone the repository:
   ```sh
   git clone https://github.com/code-xhyun/serverless-nestjs-boilerplate.git
   ```
2. Navigate to the project directory:
    ```sh
    cd fargate
    ```
3. Initialize terraform
   ```sh
   terraform init
   ```
4. Edit the var.tfvars file with your desired values.

5.  Verification of the configuration
    ```sh
    terraform plan -var-file=var.tfvars
    ```
6. Deploy
    ```sh
    terraform apply -var-file=var.tfvars
    ```
7. Destroy
    ```sh
    terraform destroy -var-file=var.tfvars
    ```


## Contributing
If you'd like to contribute to this project, please fork the repository and make the desired changes. Then, submit a pull request for review.

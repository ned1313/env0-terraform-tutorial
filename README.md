# env0-terraform-tutorial

Welcome! This code is meant to accompany the Terraform Tutorial on env0's blog. The code included will deploy a resource group and container instance on Microsoft Azure.

## Prerequisites

* An Azure subscription
* [Azure CLI installed](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
* [Terraform installed](https://developer.hashicorp.com/terraform/downloads)

You can alternatively use the Azure Cloud Shell that has the Azure CLI and Terraform preinstalled.

## Getting Started

Start by logging in to your Azure account using the Azure CLI:

```bash
# Login into Azure in a browser
az login

# Select the Azure subscription to use
az account set -s SUB_NAME
```

Now you can initialize Terraform:

```bash
terraform init
```

## Deploying the Infrastructure

To deploy the infrastructure, run the following command:

```bash
terraform plan -out plan.out
terraform apply plan.out
```

Once you deployed it successfully, remove the commented out tags argument in the `azurerm_resource_group` resource and deploy again.

```bash
terraform apply -auto-approve
```

## Destroying the Infrastructure

When you're done, you can destroy the infrastructure by running:

```bash
terraform destroy
```

## Next Steps

I hope you enjoyed this tutorial! If you have any questions, feel free to reach out to me on [Twitter](https://twitter.com/ned1313) or [LinkedIn](https://www.linkedin.com/in/ned-bellavance/).
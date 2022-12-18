# 1. Terraform Settings Block
# 2. Required Version Terraform
# 3. Required Terraform Providers
# 4. Terraform Remote State Storage with Azure Storage Account (last step of this section)
# 5. Terraform Provider Block for AzureRM
# 6. Terraform Resource Block: Define a Random Pet Resource

# 1. Terraform Settings Block
terraform {
  # 2. Required Version Terraform
  required_version = ">= 1.0"
  # 3. Required Terraform Providers
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  
  
  # 4. Terraform Remote State Storage with Azure Storage Account
  backend "azurerm" {
    resource_group_name  = "terraform-storage-rg"
    storage_account_name = "terraformstatepqrstabc"
    container_name       = "tfstatefiles"
    key                  = "terraform-custom-vnet.tfstate"
  }
  
}

# 5. Terraform Provider Block for AzureRM
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

# 6. Terraform Resource Block: Define a Random Pet Resource
resource "random_pet" "aksrandom" {

}

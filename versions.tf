terraform {
  required_version = ">= 1.5.7"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 3.1.0"
    }
  }
}

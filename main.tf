terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "FIAP-SOAT-8-G6"

    workspaces {
      name = "gh-actions"
    }
  }
}

provider "aws" {
  region  = var.regionDefault
}

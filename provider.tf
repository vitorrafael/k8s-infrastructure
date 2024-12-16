provider "aws" {
  region = var.regionDefault
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}
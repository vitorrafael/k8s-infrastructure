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
  region = var.regionDefault
}

resource "aws_eks_cluster" "eks-cluster" {
  name     = var.projectName
  role_arn = data.aws_iam_role.labrole.arn

  vpc_config {
    subnet_ids         = [for subnet in data.aws_subnet.subnet : subnet.id]
    security_group_ids = [aws_security_group.sg.id]
  }

  access_config {
    authentication_mode = var.accessConfig
  }
}

resource "aws_security_group" "sg" {
  name        = "SG-${var.projectName}"
  description = "EKS Cluster Security Group"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    description = "All"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
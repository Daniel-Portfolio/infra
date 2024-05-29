terraform {

  backend "s3" {
    bucket         = "dani-tf-state"
    key            = "portfolio/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "daniel-tf-state-lock"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.51.1"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.30.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.13.2"
    }
  }
}

provider "aws" {
  region = local.eks_name

  default_tags {
    tags = {
      Owner           = "daniel.rashba"
      bootcamp        = 20
      expiration_date = "06-06-2024"
    }
  }
}

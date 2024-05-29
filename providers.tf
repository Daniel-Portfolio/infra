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
  region = local.region

  default_tags {
    tags = {
      Owner           = "daniel.rashba"
      bootcamp        = 20
      expiration_date = "06-06-2024"
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.eks.certificate_authority[0].data)
    exec {
      api_version = "client.authentication.k8s.io/v1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", "${local.cluster_name}"]
    }
  }
}



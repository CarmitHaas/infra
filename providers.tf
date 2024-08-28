terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.10"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.5"
    }
  }

    backend "s3" {
       bucket         = "carmiterrbucket"
       key            = "terraform.tfstate"
       region         = "us-east-1"
    }
}





provider "aws" {
  region = var.region
  shared_credentials_files = ["~/.aws/credentials"]

    default_tags {
    tags = {
      owner           = var.owner
      bootcamp        = var.bootcamp
      expiration_date = var.expiration_date
    }
  }
}

provider "kubernetes" {
  host                   = module.compute.cluster_endpoint
  cluster_ca_certificate = base64decode(module.compute.cluster_ca_certificate)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", module.compute.cluster_name]
  }
}

provider "helm" {
  kubernetes {
    host                   = module.compute.cluster_endpoint
    cluster_ca_certificate = base64decode(module.compute.cluster_ca_certificate)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", module.compute.cluster_name]
    }
  }
}

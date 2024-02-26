provider "aws" {
  region = var.region
  default_tags {
    tags = var.tags
  }
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    helm = {
      version = "2.6.0"
    }
    kubernetes = {
      version = "2.12.1"
    }
  }


  backend "s3" {
    bucket         = ""
    key            = ""
    region         = "ap-south-1"
    dynamodb_table = "tf-mike-lock"
    encrypt        = true
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks_cluster_and_worker_nodes.endpoint
    cluster_ca_certificate = base64decode(module.eks_cluster_and_worker_nodes.certificate_authority)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.eks_cluster_and_worker_nodes.name]
      command     = "aws"
    }
  }
}


provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "aws" {
  region = var.region
  profile = "mike"
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
      version = "3.0.2"
    }
    kubernetes = {
      version = "2.38.0"
    }
  }


  backend "s3" {
    bucket         = "little-book-tf-mike"
    key            = "eks/state.tfstate"
    region         = "us-east-1"
    # dynamodb_table = "tf-mike-lock"
    use_lockfile   = true
    # assume_role = {
    #   role_arn = "arn:aws:iam::590183661216:user/terraform-user"
    # }
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
  config_context = "mike"
}

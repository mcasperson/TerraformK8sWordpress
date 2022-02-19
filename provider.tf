terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
    }
  }

  backend "s3" {
    bucket = "mattc-tf-bucket"
    key    = "wordpress"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
}

provider "kubernetes" {
  host     = "9581B0295D9677654019234974C59512.gr7.us-west-2.eks.amazonaws.com"
  insecure = true

  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    args        = ["token", "--cluster-id", "my-cluster"]
    command     = "aws-iam-authenticator"
  }
}
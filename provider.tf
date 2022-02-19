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
  config_path    = "~/.kube/config"
}
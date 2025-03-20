terraform {
  required_version = ">=0.13"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    helm = {
      version = ">=2.7.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.5"
    }
    kubernetes = {
        source = "hashicorp/kubernetes"
        version = "~>2.35.1"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.4"
    }

  }
}

provider "aws" {
    # export AWS_ACCESS_KEY_ID=""
    # export AWS_SECRET_ACCESS_KEY=""
    region = var.region
}

data "aws_availability_zones" "available" {}

# provider "helm" {
#     alias = "euwest1"
#     kubernetes {
#         host                   = azurerm_kubernetes_cluster.final_project["euwest1"].kube_config[0].host
#         client_certificate     = base64decode(azurerm_kubernetes_cluster.final_project["euwest1"].kube_config[0].client_certificate)
#         client_key             = base64decode(azurerm_kubernetes_cluster.final_project["euwest1"].kube_config[0].client_key)
#         cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.final_project["euwest1"].kube_config[0].cluster_ca_certificate)

#     }
# }

# provider "kubernetes" {
#   alias                  = "euwest1"
#   host                   = module.eks.cluster_endpoint
#   client_certificate     = base64decode(module.eks.kubeconfig.0.client_certificate)
#   client_key             = base64decode(module.eks.kubeconfig.0.client_key)
#   cluster_ca_certificate = base64decode(module.eks.kubeconfig.0.cluster_ca_certificate)
# }

# provider "helm" {
#   alias                  = "euwest1"
#   kubernetes {
#     host                   = module.eks.cluster_endpoint
#     client_certificate     = base64decode(module.eks.kubeconfig.0.client_certificate)
#     client_key             = base64decode(module.eks.kubeconfig.0.client_key)
#     cluster_ca_certificate = base64decode(module.eks.kubeconfig.0.cluster_ca_certificate)
#   }
 
# }

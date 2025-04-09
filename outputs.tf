# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = aws_eks_cluster.devops-eks.endpoint
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = aws_eks_cluster.devops-eks.name
}

# output "nginx_eip" {
#   value = aws_eip.nginx_eip.id
#   description = "Elastic IP for the Nginx Load Balancer"
# }

output "load_balancer_dns" {
  value       = aws_lb.eks_lb.dns_name
  description = "The DNS name of the load balancer"
}
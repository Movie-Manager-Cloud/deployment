variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}

variable "cluster-name" {
  default = "devops-eks"
  type    = string
}


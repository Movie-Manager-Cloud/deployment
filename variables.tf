variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "cluster-name" {
  default = "devops-eks"
  type    = string
}


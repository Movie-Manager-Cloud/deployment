variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "cluster-name" {
  default = "devops-eks"
  type    = string
}

variable "run_id" {
  description = "The GitHub Actions run ID"
  type        = string
}
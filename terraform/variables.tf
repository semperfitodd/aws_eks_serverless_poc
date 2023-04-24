variable "argocd_chart_version" {
  description = "ArgoCD Helm Chart Version"
  type        = string

  default = "4.5.3"
}

variable "argocd_helm_settings" {
  description = "Additional settings for ArgoCD Helm deployment"
  type        = any

  default = {
    server = {
      extraArgs = ["--insecure"]
    }
  }
}

variable "eks_cluster_version" {
  description = "Kubernetes version for EKS cluster"
  type        = string

  default = "1.26"
}

variable "environment" {
  description = "Environment name for project"
  type        = string

  default = "aws_eks_serverless_poc"
}

variable "public_domain" {
  description = "Public DNS zone name"
  type        = string

  default = "bsisandbox.com"
}

variable "region" {
  description = "AWS Region where resources will be deployed"
  type        = string

  default = "us-east-2"
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)

  default = {}
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC where resources will be deployed"
  type        = string

  default = "10.230.0.0/16"
}
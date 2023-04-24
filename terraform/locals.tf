locals {
  environment = replace(var.environment, "_", "-")

  argocd_domain_name = "${local.environment}-${local.kubernetes_namespace}.${var.public_domain}"

  kubernetes_namespace = "argocd"

  availability_zones = [
    data.aws_availability_zones.this.names[0],
    data.aws_availability_zones.this.names[1],
    data.aws_availability_zones.this.names[2],
  ]

  public_subnets = [
    cidrsubnet(var.vpc_cidr, 6, 0),
    cidrsubnet(var.vpc_cidr, 6, 1),
    cidrsubnet(var.vpc_cidr, 6, 2),
  ]

  private_subnets = [
    cidrsubnet(var.vpc_cidr, 6, 4),
    cidrsubnet(var.vpc_cidr, 6, 5),
    cidrsubnet(var.vpc_cidr, 6, 6),
  ]

  database_subnets = [
    cidrsubnet(var.vpc_cidr, 6, 7),
    cidrsubnet(var.vpc_cidr, 6, 8),
    cidrsubnet(var.vpc_cidr, 6, 9),
  ]
}
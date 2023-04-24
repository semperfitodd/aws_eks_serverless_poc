module "app_certificate" {
  source = "./modules/acm"

  domain_name   = "${replace(var.environment, "_", "-")}-app.${var.public_domain}"
  public_domain = var.public_domain

  tags = var.tags
}
module "integration_role" {
  source  = "terraform-aws-itmc-integration"
}

output "integration_role_arn" {
  value = module.itmc.integration_role_arn
}
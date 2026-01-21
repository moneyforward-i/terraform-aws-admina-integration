# Minimal configuration
module "itmc-integration-minimal" {
  source = "moneyforward-i/itmc-integration/aws"
}

# Full configuration with default values
module "itmc-integration-full" {
  source           = "moneyforward-i/itmc-integration/aws"
  permission_scope = "full"
  role_path        = "/integration/"
  additional_tags  = {}
}

output "itmc_role_arn" {
  value = module.itmc-integration-minimal.role_arn
}

output "itmc_role_external_id" {
  value = module.itmc-integration-minimal.external_id
}

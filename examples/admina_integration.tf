# Minimal configuration
module "admina-integration-minimal" {
  source = "moneyforward-i/admina-integration/aws"
}

# Full configuration with default values
module "admina-integration-full" {
  source           = "moneyforward-i/admina-integration/aws"
  permission_scope = "full"
  role_path        = "/integration/"
  additional_tags  = {}
}

output "admina_role_arn" {
  value = module.admina-integration-minimal.role_arn
}

output "admina_role_external_id" {
  value = module.admina-integration-minimal.external_id
}

# This file can be copied and used as it is.
module "admina-integration" {
  source = "moneyforward-i/admina-integration/aws"
}
output "admina_role_arn" {
  value = module.admina-integration.role_arn
}
output "admina_role_external_id" {
  value = module.admina-integration.external_id
}

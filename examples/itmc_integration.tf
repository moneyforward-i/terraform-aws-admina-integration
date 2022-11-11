# This file can be copied and used as it is.
module "itmc-integration" {
  source  = "moneyforward-i/itmc-integration/aws"
}
output "itmc_role_arn" {
  value = module.itmc-integration.role_arn
}
output "itmc_role_external_id" {
  value = module.itmc-integration.external_id
}

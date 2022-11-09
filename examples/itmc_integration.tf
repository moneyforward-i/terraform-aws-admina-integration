# This file can be copied and used as it is.
module "itmc" {
  source  = "terraform-aws-itmc-integration"
}
output "itmc_role_arn" {
  value = module.itmc.integration_role_arn
}
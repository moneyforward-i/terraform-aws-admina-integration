# terraform-aws-itmc-integration

<!-- # Short Description -->

This is a Terraform Module that can be used for AWS Integration provided by Money Forward i.

<!-- # Badges -->

[![Github issues](https://img.shields.io/github/issues/moneyforward-i/terraform-aws-itmc-integration)](https://github.com/moneyforward-i/terraform-aws-itmc-integration/issues)
[![Github forks](https://img.shields.io/github/forks/moneyforward-i/terraform-aws-itmc-integration)](https://github.com/moneyforward-i/terraform-aws-itmc-integration/network/members)
[![Github stars](https://img.shields.io/github/stars/moneyforward-i/terraform-aws-itmc-integration)](https://github.com/moneyforward-i/terraform-aws-itmc-integration/stargazers)
[![Github top language](https://img.shields.io/github/languages/top/moneyforward-i/terraform-aws-itmc-integration)](https://github.com/moneyforward-i/terraform-aws-itmc-integration/)
[![Github license](https://img.shields.io/github/license/moneyforward-i/terraform-aws-itmc-integration)](https://github.com/moneyforward-i/terraform-aws-itmc-integration/)

# Tags

`IT Management Cloud` `SaaS Management Platform`

# Advantages

You can easily create a Role to connect to the IT Management Cloud with AWS which was provided by Money Forward i. 

This Terraform Module is maintained regularly by Money Forward i, 
so you can easily keep it up-to-date by importing it as a Module.

[Official page(JP)](https://i.moneyforward.com/) [(EN)](https://i.moneyforward.com/us/)

[Integration Support Page](https://support.itmc.i.moneyforward.com/article/dc2mjsw9oy-aws)


# About Module
<!-- 
  The following Document is automatically generated. 
  If you want to change them, edit `./.terraform-docs.yml`. 
-->
<!-- BEGIN_TF_DOCS -->

<!--  -->

Some more information can go here.

## Installation
Just only add the following code to your Terraform code

```hcl
# This file can be copied and used as it is.
module "itmc-integration" {
  source  = "moneyforward-i/itmc-integration/aws"
}
output "itmc_role_arn" {
  value = module.itmc-integration.role_arn
}
```
To learn how to use Modules in Terraform, let's to see [here](https://developer.hashicorp.com/terraform/language/modules).

## Specifications
### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | A mapping of additional resource tags | `map(string)` | `{}` | no |
| <a name="input_role_path"></a> [role\_path](#input\_role\_path) | Path to place the Role. | `string` | `"/integration/"` | no |
<!-- ### Modules

No modules. -->
### Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | The output is the Arn of the Role that was created. <br>This value will be able to enter into IntegrationPage on ITMC |
<!--  -->
<!--  -->
### Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_policy_document.role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trusted_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
<!--  -->
<!-- END_TF_DOCS -->


<!-- CREATED_BY_LEADYOU_README_GENERATOR -->
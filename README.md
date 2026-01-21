# terraform-aws-admina-integration

<!-- # Short Description -->

This is a Terraform Module that can be used for AWS Integration provided by Money Forward i (Admina).

https://registry.terraform.io/modules/moneyforward-i/admina-integration/aws/latest


<!-- # Badges -->
[![Latest Rlease](https://badgen.net/github/release/moneyforward-i/terraform-aws-admina-integration?icon=github&color=cyan)](https://github.com/moneyforward-i/terraform-aws-admina-integration/releases/latest)
[![Terraform Regstly](https://badgen.net/badge/icon/available?icon=terraform&label=registry&color=cyan)](https://registry.terraform.io/modules/moneyforward-i/admina-integration/aws/latest)

[![Github issues](https://img.shields.io/github/issues/moneyforward-i/terraform-aws-admina-integration)](https://github.com/moneyforward-i/terraform-aws-admina-integration/issues)
[![Github forks](https://img.shields.io/github/forks/moneyforward-i/terraform-aws-admina-integration)](https://github.com/moneyforward-i/terraform-aws-admina-integration/network/members)
[![Github stars](https://img.shields.io/github/stars/moneyforward-i/terraform-aws-admina-integration)](https://github.com/moneyforward-i/terraform-aws-admina-integration/stargazers)
[![Github top language](https://img.shields.io/github/languages/top/moneyforward-i/terraform-aws-admina-integration)](https://github.com/moneyforward-i/terraform-aws-admina-integration/)
[![Github license](https://img.shields.io/github/license/moneyforward-i/terraform-aws-admina-integration)](https://github.com/moneyforward-i/terraform-aws-admina-integration/)

# Tags

`Admina` `SaaS Management Platform`

# Advantages

You can easily create a Role to connect to Admina with AWS which was provided by Money Forward i.

This Terraform Module is maintained regularly by Money Forward i, 
so you can easily keep it up-to-date by importing it as a Module.

[Official page(JP)](https://i.moneyforward.com/) [(EN)](https://i.moneyforward.com/us/)

[Integration Support Page](https://support.itmc.i.moneyforward.com/article/dc2mjsw9oy-aws)

# Permission Scope

This module supports two permission scopes to control the level of access granted to the integration role:

| Scope | Description | Use Case |
|-------|-------------|----------|
| `full` (default) | Read-write access including provisioning/deprovisioning | Full integration with user lifecycle management |
| `read` | Read-only access without write permissions | Monitoring and reporting only |

## Permissions by Scope

### Always Included (Both Scopes)

| Service | Permissions | Purpose |
|---------|-------------|---------|
| IAM | `GetAccessKeyLastUsed`, `GetRole`, `ListAccessKeys`, `ListAttachedRolePolicies`, `ListAttachedUserPolicies`, `ListGroupsForUser`, `ListMFADevices`, `ListRolePolicies`, `ListRoles`, `ListUserPolicies`, `ListUsers`, `ListUserTags` | User and role aggregation |
| Account | `GetContactInformation` | Account name retrieval |
| Identity Store | `ListGroups`, `ListGroupMemberships`, `ListUsers` | IAM Identity Center user/group aggregation |
| SSO Admin | `DescribePermissionSet`, `ListAccountAssignmentsForPrincipal`, `ListInstances`, `ListPermissionSets` | Permission set information |
| Organizations | `ListAccounts` | Account listing for Identity Center |

### Full Scope Only (Write Permissions)

| Service | Permissions | Purpose |
|---------|-------------|---------|
| IAM | `CreateUser`, `DeleteAccessKey`, `DeleteLoginProfile`, `DeleteRole`, `DeleteUser`, `DetachRolePolicy`, `DetachUserPolicy`, `TagUser` | User provisioning/deprovisioning |
| Identity Store | `CreateGroupMembership`, `CreateUser`, `DeleteUser` | Identity Center provisioning/deprovisioning |

## Usage Examples

### Full Access (Default - Backward Compatible)

```hcl
module "admina-integration" {
  source = "moneyforward-i/admina-integration/aws"
}
```

### Read-Only Access

```hcl
module "admina-integration" {
  source           = "moneyforward-i/admina-integration/aws"
  permission_scope = "read"
}
```


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
module "admina-integration" {
  source  = "moneyforward-i/admina-integration/aws"
}
output "admina_role_arn" {
  value = module.admina-integration.role_arn
}
output "admina_role_external_id" {
  value = module.admina-integration.external_id
}
```
To learn how to use Modules in Terraform, let's to see [here](https://developer.hashicorp.com/terraform/language/modules).

## Specifications
### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | A mapping of additional resource tags | `map(string)` | `{}` | no |
| <a name="input_permission_scope"></a> [permission\_scope](#input\_permission\_scope) | Permission scope for the integration role. Use 'full' for read-write access (provisioning/deprovisioning enabled) or 'read' for read-only access. | `string` | `"full"` | no |
| <a name="input_role_path"></a> [role\_path](#input\_role\_path) | Path to place the Role. | `string` | `"/integration/"` | no |
<!-- ### Modules

No modules. -->
### Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | The output is the Arn of the Role that was created. <br>This value will be able to enter into IntegrationPage on Admina |
| <a name="output_external_id"></a> [external\_id](#output\_external\_id) | The output is the External ID of the Role that was created. <br>This value will be able to enter into IntegrationPage on Admina |
<!--  -->
<!--  -->
### Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [random_id.extrnal_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_iam_policy_document.role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trusted_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
<!--  -->
<!-- END_TF_DOCS -->


<!-- CREATED_BY_LEADYOU_README_GENERATOR -->

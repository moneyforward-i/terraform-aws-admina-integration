locals {
  extrnal_id     = random_id.extrnal_id.id
  integration_id = "162001151631"
  is_full_scope  = var.permission_scope == "full"
}

resource "random_id" "extrnal_id" {
  byte_length = 32
}

resource "aws_iam_role" "this" {
  path               = var.role_path
  name               = "IT-Management-Cloud-Integration-Role"
  description        = "IT Management Cloud Service use this role to integrate with AWS."
  assume_role_policy = data.aws_iam_policy_document.trusted_policy.json
  tags = merge(
    var.additional_tags,
    {
      "Name" = "IT Management Cloud Integration Role"
    },
  )
}

data "aws_iam_policy_document" "trusted_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${local.integration_id}:root"]
    }
    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = [local.extrnal_id]
    }
  }
}

resource "aws_iam_role_policy" "role_policy" {
  name   = "IT-Management-Cloud-Integration-Role-Policy"
  role   = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.role_policy.json
}

data "aws_iam_policy_document" "role_policy" {
  statement {
    sid    = "IAMReadAccess"
    effect = "Allow"
    actions = [
      "iam:GetAccessKeyLastUsed",
      "iam:GetRole",
      "iam:ListAccessKeys",
      "iam:ListAttachedRolePolicies",
      "iam:ListAttachedUserPolicies",
      "iam:ListGroupsForUser",
      "iam:ListMFADevices",
      "iam:ListRolePolicies",
      "iam:ListRoles",
      "iam:ListUserPolicies",
      "iam:ListUsers",
      "iam:ListUserTags",
    ]
    resources = ["*"]
  }

  dynamic "statement" {
    for_each = local.is_full_scope ? [1] : []
    content {
      sid    = "IAMWriteAccess"
      effect = "Allow"
      actions = [
        "iam:CreateUser",
        "iam:DeleteAccessKey",
        "iam:DeleteLoginProfile",
        "iam:DeleteRole",
        "iam:DeleteUser",
        "iam:DetachRolePolicy",
        "iam:DetachUserPolicy",
        "iam:TagUser",
      ]
      resources = ["*"]
    }
  }

  statement {
    sid    = "AccountReadAccess"
    effect = "Allow"
    actions = [
      "account:GetContactInformation",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "IdentityStoreReadAccess"
    effect = "Allow"
    actions = [
      "identitystore:ListGroups",
      "identitystore:ListGroupMemberships",
      "identitystore:ListUsers",
    ]
    resources = ["*"]
  }

  dynamic "statement" {
    for_each = local.is_full_scope ? [1] : []
    content {
      sid    = "IdentityStoreWriteAccess"
      effect = "Allow"
      actions = [
        "identitystore:CreateGroupMembership",
        "identitystore:CreateUser",
        "identitystore:DeleteUser",
      ]
      resources = ["*"]
    }
  }

  statement {
    sid    = "SSOAdminReadAccess"
    effect = "Allow"
    actions = [
      "sso:DescribePermissionSet",
      "sso:ListAccountAssignmentsForPrincipal",
      "sso:ListInstances",
      "sso:ListPermissionSets",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "OrganizationsReadAccess"
    effect = "Allow"
    actions = [
      "organizations:ListAccounts",
    ]
    resources = ["*"]
  }
}


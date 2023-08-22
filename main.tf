locals {
  extrnal_id     = random_id.extrnal_id.id
  integration_id = "162001151631"
}
resource "random_id" "extrnal_id" {
  byte_length = 32
}


resource "aws_iam_role" "this" {
  path               = var.role_path
  name               = "Admina-Integration-Role"
  description        = "Admina Service use this role to integrate with AWS."
  assume_role_policy = data.aws_iam_policy_document.trusted_policy.json
  tags = merge(
    var.additional_tags,
    {
      "Name" = "Admina Integration Role"
    },
  )
}

# Trust relationships policy document
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
  name   = "Admina-Integration-Role-Policy"
  role   = aws_iam_role.this.id
  policy = var.read_only ? data.aws_iam_policy_document.read_only_role_policy.json : data.aws_iam_policy_document.role_policy.json
}

data "aws_iam_policy_document" "role_policy" {
  statement {
    sid    = "IntegrationAccessPolicy"
    effect = "Allow"
    actions = [
      "iam:GetAccessKeyLastUsed",
      "iam:ListAccessKeys",
      "iam:ListAttachedUserPolicies",
      "iam:ListGroupsForUser",
      "iam:ListMFADevices",
      "iam:ListRolePolicies",
      "iam:ListRoles",
      "iam:ListUsers",
      "iam:ListUserTags",
      "iam:DeleteUser",
      "iam:DeleteAccessKey",
      "iam:DeleteRole",
      "iam:ListAttachedRolePolicies",
      "iam:DetachRolePolicy",
      "iam:DeleteLoginProfile",
      "iam:ListAttachedUserPolicies",
      "iam:DetachUserPolicy",
      "iam:CreateUser",
      "iam:TagUser",
      "iam:ListUserPolicies",
      "account:GetContactInformation"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "read_only_role_policy" {
  statement {
    sid    = "IntegrationAccessPolicy"
    effect = "Allow"
    actions = [
      "iam:GetAccessKeyLastUsed",
      "iam:ListAccessKeys",
      "iam:ListAttachedUserPolicies",
      "iam:ListGroupsForUser",
      "iam:ListMFADevices",
      "iam:ListRolePolicies",
      "iam:ListRoles",
      "iam:ListUsers",
      "iam:ListUserTags",
      "iam:ListAttachedRolePolicies",
      "iam:ListAttachedUserPolicies",
      "iam:TagUser",
      "iam:ListUserPolicies",
      "account:GetContactInformation"
    ]
    resources = ["*"]
  }
}

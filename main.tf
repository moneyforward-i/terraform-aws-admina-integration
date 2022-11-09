locals {
  extrnal_id = "money-forward-i"
  integration_id = "162001151631"
}

resource "aws_iam_role" "this" {
  path               = var.role_path
  name               = "IT Management Cloud Integration Role"
  description        = "IT Management Cloud Service use this role to integrate with AWS."
  assume_role_policy = data.aws_iam_policy_document.trusted_policy.json
  tags = merge(
    var.additional_tags,
    {
      "Name" = "IT Management Cloud Integration Role"
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

resource "aws_iam_role_policy_attachment" "role_policy" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_role_policy.role_policy.id
}

resource "aws_iam_role_policy" "role_policy" {
  name        = "IT Management Cloud Integration Role Policy"
  description = "IT Management Cloud Integration Role will use this role to integrate with IT Management Cloud"
  policy = data.aws_iam_policy_document.role_policy.json
  tags = merge(
    var.additional_tags,
    {
      "Name" = "IT Management Cloud Integration Role Role"
    },
  )
}

data "aws_iam_policy_document" "role_policy" {
  sid = "ITMC_Integration"
  statement {
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
                "account:GetContactInformation"
    ]
    resources = ["*"]
  }
}


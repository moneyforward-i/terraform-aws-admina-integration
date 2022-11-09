output "integration_role_arn" {
  value = aws_iam_role.this.arn
  description = "The output is the Arn of the Role that was created. <br>This value will be able to enter into IntegrationPage on ITMC"
}
output "cloudwatch_grafana_role" {
  value = {
    arn = aws_iam_role.cloudwatch_grafana.arn
  }
}

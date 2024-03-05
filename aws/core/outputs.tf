# output "cloudwatch_grafana_role" {
#   value = {
#     arn = aws_iam_role.cloudwatch_grafana.arn
#   }
# }

output "environments" {
  value = {
    pulselink = {
      s3_bucket_name      = module.pulselink.s3_bucket_name
      dynamodb_table_name = module.pulselink.dynamodb_table_name
    }
  }
}

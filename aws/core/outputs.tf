# output "cloudwatch_grafana_role" {
#   value = {
#     arn = aws_iam_role.cloudwatch_grafana.arn
#   }
# }

output "environments" {
  value = {
    pulselink = {
      s3_bucket_name      = module.pulselink_env.s3_bucket_name
      dynamodb_table_name = module.pulselink_env.dynamodb_table_name
    }
  }
}

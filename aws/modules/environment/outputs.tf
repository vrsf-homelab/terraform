output "name" {
  value = var.name
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.this.name
}

output "s3_bucket_name" {
  value = module.s3-bucket.s3_bucket_id
}

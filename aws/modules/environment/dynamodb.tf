resource "aws_dynamodb_table" "this" {
  name = "${var.name}-terraform"

  billing_mode                = "PAY_PER_REQUEST"
  table_class                 = "STANDARD"
  deletion_protection_enabled = true

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = merge(
    var.tags,
    {
      Environment = var.name
    }
  )
}

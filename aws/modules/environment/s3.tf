module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.1"

  bucket = "${var.name}-terraform"

  versioning = {
    enabled = true
  }

  tags = merge(
    var.tags,
    {
      Environment = var.name
    }
  )
}

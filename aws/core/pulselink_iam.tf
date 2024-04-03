module "pulselink_iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 5.37"

  name = "pulselink"

  create_iam_user_login_profile = false
  create_iam_access_key         = false
  force_destroy                 = true

  policy_arns = [
    module.pulselink_iam_env_policy.arn
  ]

  tags = merge(
    module.common.tags,
    {
      "Project" = "pulselink"
    }
  )
}

module "pulselink_iam_env_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 5.37"

  name = "TerraformEnvironmentPolicy-pulselink"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      # S3
      {
        "Effect" : "Allow",
        "Action" : "s3:ListBucket",
        "Resource" : "arn:aws:s3:::${module.pulselink_env.s3_bucket_name}"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject",
          "s3:PutObject"
        ],
        "Resource" : "arn:aws:s3:::${module.pulselink_env.s3_bucket_name}/*"
      },
      # DynamoDB
      {
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:DescribeTable",
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:DeleteItem"
        ],
        "Resource" : "arn:aws:dynamodb:*:*:table/${module.pulselink_env.dynamodb_table_name}"
      },
      # IAM
      {
        "Effect" : "Allow",
        "Action" : [
          "iam:*Role",
          "iam:*RolePolicy",
          "iam:*RolePolicies",
          "iam:*AssumeRolePolicy",
          "iam:*IDConnectProvider",
          "iam:ListInstanceProfilesForRole",
        ],
        "Resource" : "*"
      },
      # KMS
      {
        "Effect": "Allow",
        "Action": [
          "kms:*",
        ],
        "Resource" : "*"
      },
      {
        "Effect": "Allow",
        "Action": [
          "codeartifact:*"
        ],
        "Resource": "*"
      }
    ]
  })

  tags = merge(
    module.common.tags,
    {
      "Project" = "pulselink"
    }
  )
}

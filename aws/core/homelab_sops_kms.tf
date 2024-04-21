resource "aws_kms_key" "homelab_sops_kms" {
  description         = "Homelab SOPS"
  enable_key_rotation = false

  tags = module.common.tags
}

resource "aws_kms_alias" "homelab_sops_kms" {
  name          = "alias/vrsf-homelab-sops"
  target_key_id = aws_kms_key.homelab_sops_kms.key_id
}

data "aws_iam_policy_document" "homelab_sops_kms" {
  statement {
    sid    = "HomelabSOPSKMSAccess"
    effect = "Allow"
    resources = [
      aws_kms_key.homelab_sops_kms.arn
    ]

    actions = [
      "kms:Decrypt*",
      "kms:Encrypt*",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey",
      "kms:DescribeKey",
    ]
  }
}

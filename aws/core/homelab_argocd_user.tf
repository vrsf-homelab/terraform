module "homelab_argocd_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 5.39"

  name = "vrsf-homelab-argocd"

  create_iam_user_login_profile = false
  create_iam_access_key         = false
  force_destroy                 = true

  policy_arns = [
    aws_iam_policy.homelab_argocd_user_sops_kms.arn
  ]

  tags = module.common.tags
}

resource "aws_iam_policy" "homelab_argocd_user_sops_kms" {
  name        = "HomelabArgoCDUserPolicy"
  description = "Homelab ArgoCD User Policy"
  policy      = data.aws_iam_policy_document.homelab_sops_kms.json
}

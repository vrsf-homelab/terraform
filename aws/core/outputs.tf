output "homelab" {
  value = {
    argocd = {
      user_name = module.homelab_argocd_user.iam_user_name
    }
    sops = {
      kms_key_id = aws_kms_key.homelab_sops_kms.key_id
      kms_alias  = aws_kms_alias.homelab_sops_kms.arn
    }
  }
}

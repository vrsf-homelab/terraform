module "common" {
  source = "../modules/common"
}

module "oidc_github" {
  source  = "vrs-factory/oidc-github/aws"
  version = "1.0.0"

  url        = "https://token.actions.githubusercontent.com"
  client_ids = ["sts.amazonaws.com"]
  extra_thumbprints = [
    "6938fd4d98bab03faadb97b34396831e3780aea1"
  ]

  tags = module.common.tags
}

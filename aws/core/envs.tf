module "pulselink" {
  source = "../modules/environment"

  name = "pulselink"

  tags = module.common.tags
}

module "pulselink_env" {
  source = "../modules/environment"

  name = "pulselink"

  tags = merge(
    module.common.tags,
    {
      "Project" = "pulselink"
    }
  )
}

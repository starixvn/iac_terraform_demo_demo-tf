locals {
  project     = var.project
  environment = var.environment
  team        = var.team
  common_tags = {
    Dept        = "VNTeam"
    Team        = local.team
    ManageBy    = "vnTerraform"
    Environment = local.environment
  }
}
data "aws_availability_zones" "available" {
}

locals {
  azs_sliced = slice(data.aws_availability_zones.available.names, 0, var.rudder_num_availability_zones == -1 || var.rudder_num_availability_zones > length(data.aws_availability_zones.available.names) ? length(data.aws_availability_zones.available.names) : var.rudder_num_availability_zones)
}
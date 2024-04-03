# SG for Web Application
module "private_web_sg_v1" {
  source      = "gitlab.nexdev.net/iac/security-group/aws"
  version     = "5.0.0"
  name        = lower("${var.team}-${var.environment}-web-sg")
  description   = "Managed by vnTerraform"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  #var.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "prometheus-http-tcp", "all-icmp"]
  ingress_cidr_blocks = var.cidr_block_internal
  egress_rules        = ["all-all"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 9001
      to_port     = 9001
      protocol    = 6
      description = "Allow Portainer"
      cidr_blocks = var.allow_cidr_block_internal
    },
    {
      from_port   = 8088
      to_port     = 8088
      protocol    = 6
      description = "Allow Port 8088"
      cidr_blocks = var.allow_cidr_block_internal
    },
    {
      from_port   = 22222
      to_port     = 22222
      protocol    = 6
      description = "Allow DeployAPI"
      cidr_blocks = var.allow_cidr_block_internal
    },
  ]
  tags = merge(
    local.common_tags,
    {
      Resource = "SG"
    },
  )
}

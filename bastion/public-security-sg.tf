
module "public_bastion_linux_sg" {
  source      = "gitlab.nexdev.net/iac/security-group/aws"
  version     = "5.0.0"
  name        = lower("${var.team}-${var.environment}-public-bastion-sg")
  description = "Security Group with SSH port open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["202.78.231.32/27", "120.72.109.32/29", "120.72.83.128/29"]
  # Egress Rule - all-all open
  egress_rules = ["all-all"]
}
module "public_bastion_windows_sg" {
  source      = "gitlab.nexdev.net/iac/security-group/aws"
  version     = "5.0.0"
  name        = lower("${var.team}-${var.environment}-public-bastion-sg")
  description = "Security Group with RDP port open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules       = ["rdp-tcp"]
  ingress_cidr_blocks = ["202.78.231.32/27", "120.72.109.32/29", "120.72.83.128/29"]
  # Egress Rule - all-all open
  egress_rules = ["all-all"]
}

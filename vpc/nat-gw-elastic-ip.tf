resource "aws_eip" "nat_gw_elastic_ip" {
  #instance   = module.public_bastion_linux.vnteam-ssh-server-1.id
  tags = merge(
    local.common_tags,
    {
      Name     = lower("${var.team}-${var.environment}-nat-eip")
      Resource = "VPC"
    },
  )
}

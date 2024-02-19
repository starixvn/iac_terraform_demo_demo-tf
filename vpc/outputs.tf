# VPC Output Values
# output "vpc" {
#   value = module.vpc
# }
/*
output "private_web_sg" {
  value = module.web_sg.security_group_id
}

output "private_db_mongo_sg" {
  value = module.db_mongo_sg.security_group_id
}

# output "proxy_gw_sg" {
#   value = module.proxy_gw_sg.security_group_id
# }
*/

# VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

# VPC CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

# VPC Private Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

# VPC Public Subnets
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

# VPC NAT gateway Public IP
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_public_ips
}

#  EIP
output "eip" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = aws_eip.nat_gw_elastic_ip.public_ip
}
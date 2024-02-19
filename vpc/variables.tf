variable "aws_region" {
  description = "aws region"
  type        = string
}

variable "aws_profile" {
  description = "aws profile"
  type        = string
}

# VPC CIDR Block
variable "vpc_cidr_block" {
  description = "The IP address range of the VPC in CIDR notation. A prefix of /16 is recommended. Do not use a prefix higher than /27."
  type        = string
}

variable "secondary_cidr_blocks" {
  description = "List of secondary CIDR blocks to associate with the VPC to extend the IP Address pool"
  type        = list(string)
  default     = []
}

variable "vpc_cidr_subnetwork_width_delta" {
  description = "The difference between your network and subnetwork netmask; an /16 network and a /20 subnetwork would be 4."
  type        = number
  default     = 4 #10.6.32.0/20 10.6.32.1 -> 10.6.47.254  4094
}

# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
}

variable "team" {
  description = "Team name"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "allow ingress_cidr_blocks"
  type        = list(string)
  default     = []
}

variable "allow_whitelist" {
  description = "allow whitelist"
  type        = string
}

variable "enable_nat_gateway" {
  type = string
}
variable "single_nat_gateway" {
  type = string
}

variable "project" {
  type = string
}

###########EKS
variable "rudder_disk_size_gb" {
  description = "Default disk size on each worker node. Used for logs and temporary storage."
  type        = string
  default     = "30"
}

variable "rudder_num_availability_zones" {
  description = "Number of availability zones to create the Rudder cluster. Set it to -1 to deploy in all AZs"
  type        = number
  default     = 1
}
# for base/network.tf
# reserve Elastic IP to be used in our NAT gateway

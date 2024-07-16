project = "clouddemo"
aws_region = "ap-northeast-1"
team = "Lumi"
environment = "testlab"
aws_profile = "test-iac-terraform-ci"
##############VPC
vpc_cidr_block         = "10.6.0.0/16"
rudder_num_availability_zones = 3
enable_nat_gateway = true
single_nat_gateway = true
ingress_cidr_blocks = ["202.78.231.32/27","120.72.109.32/29","120.72.83.128/29"] #["0.0.0.0/0"]
allow_whitelist = "202.78.231.32/27,120.72.109.32/29,120.72.83.128/29"
####

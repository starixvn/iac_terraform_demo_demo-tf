project = "cloud"
team = "Lumi"
aws_region = "ap-east-1"
environment = "local"
aws_profile = "local-iac-terraform-ci"
################## Whitelist
ingress_cidr_blocks = ["202.78.231.32/27","120.72.109.32/29","120.72.83.128/29"] #["0.0.0.0/0"]
allow_internet = "0.0.0.0/0"
allow_whitelist = "202.78.231.32/27,120.72.109.32/29,120.72.83.128/29"
cidr_block_internal = ["10.6.0.0/16"] 
#["10.6.48.0/20","10.6.64.0/20","10.6.80.0/20","10.6.0.0/20","10.6.16.0/20","10.6.32.0/20"]
allow_cidr_block_internal = "10.6.0.0/16"
#"10.6.48.0/20,10.6.64.0/20,10.6.80.0/20,10.6.0.0/20,10.6.16.0/20,10.6.32.0/20"
vpc_id = "vpc-039a936178b304105"
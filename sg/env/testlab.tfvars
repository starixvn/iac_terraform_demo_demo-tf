project = "clouddemo"
aws_region = "ap-northeast-1"
team = "Lumi"
environment = "testlab"
aws_profile = "test-iac-terraform-ci"
aws_region_bucket_remote_state = "clouddemo-lumi-starix-tf-gazelle"
aws_region_key_remote_state    = "env:/testlab/vpc-terraform.tfstate"
##############VPC
ingress_cidr_blocks = ["202.78.231.32/27","120.72.109.32/29","120.72.83.128/29"] #["0.0.0.0/0"]
allow_internet = "0.0.0.0/0"
allow_whitelist = "202.78.231.32/27,120.72.109.32/29,120.72.83.128/29"
cidr_block_internal = ["10.6.0.0/16"] 
#["10.6.48.0/20","10.6.64.0/20","10.6.80.0/20","10.6.0.0/20","10.6.16.0/20","10.6.32.0/20"]
allow_cidr_block_internal = "10.6.0.0/16"
vpc_id = "vpc-039a936178b304105"
#############

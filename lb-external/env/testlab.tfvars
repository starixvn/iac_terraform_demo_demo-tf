project = "clouddemo"
team = "Lumi"
aws_region = "ap-northeast-1"
environment = "testlab"
aws_profile = "test-iac-terraform-ci"
aws_region_bucket_remote_state = "clouddemo-lumi-starix-tf-goldfish"
aws_region_bucket_remote_state_vn = "clouddemo-lumi-starix-tf-goldfish"
aws_region_key_remote_state    = "env:/testlab/vpc-terraform.tfstate"
aws_region_key_sg_remote_state_vn = "env:/testlab/lumi-sg-tf.tfstate"
aws_region_key_remote_state_acm    = "env:/testlab/route53-acme-certificate-tf.tfstate"

#################  EC2
proxy_gw_vm = [
  {
    "application_name" : "proxy-gw-01",
    "private_ip" : "10.6.48.10",
  },
  {
    "application_name" : "proxy-gw-02",
    "private_ip" : "10.6.48.11",
  },
]
apps_vm = [
  /*{
    "application_name" : "app-01",
    "private_ip" : "10.6.32.100",
  },*/
]

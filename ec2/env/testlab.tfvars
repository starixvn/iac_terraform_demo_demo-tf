project = "clouddemo"
team = "Lumi"
aws_region = "ap-northeast-1"
environment = "testlab"
aws_profile = "test-iac-terraform-ci"
aws_region_bucket_remote_state = "clouddemo-lumi-starix-tf-gazelle"
aws_region_key_remote_state    = "env:/testlab/vpc-terraform.tfstate"
aws_region_key_iam_remote_state = "env:/testlab/lumi-iam-tf.tfstate"
aws_region_bucket_remote_state_vn = "clouddemo-lumi-starix-tf-gazelle"
aws_region_key_sg_remote_state_vn = "env:/testlab/lumi-sg-tf.tfstate"
vpc_id = "vpc-039a936178b304105"
####### EC2
public_key_location = "key/id_rsa.pub"
private_key_location = "key/id_rsa"
proxy_gw_vm = [
  {
    "application_name" : "app-01",
    "instance_type" : "t3.micro",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "20",
    "private_ip" : "10.6.48.10",
    "tag" : "EC2"
  },
  {
    "application_name" : "app-02",
    "instance_type" : "t3.micro",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "20",
    "private_ip" : "10.6.48.11",
    "tag" : "EC2"
  },
]

monitor_vm = []

apps_vm = []

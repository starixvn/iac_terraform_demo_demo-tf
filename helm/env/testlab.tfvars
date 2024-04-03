project = "clouddemo"
team = "Lumi"
aws_region = "ap-northeast-1"
environment = "testlab"
aws_profile = "test-iac-terraform-ci"
aws_region_bucket_remote_state = "clouddemo-lumi-starix-tf-gazelle"
aws_region_key_remote_state_vpc    = "env:/testlab/vpc-terraform.tfstate"
aws_region_key_remote_state_eks    = "env:/testlab/lumi-eks-tf.tfstate"
allow_whitelist = ["202.78.231.32/27","120.72.109.32/29","120.72.83.128/29"]

###############
namespaces = ["haproxy","sample","nexops","nap","alpha"]
###############
admin_users     = ["troy.vo","dennis.le","ken.test", "troy.test"] #, "troy.vo"
developer_users = ["dev1", "dev2"]

############## LB & Ingress
lb_az_cross = "true"
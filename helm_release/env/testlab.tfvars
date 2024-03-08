project = "clouddemo"
team = "Lumi"
aws_region = "ap-northeast-1"
environment = "testlab"
aws_profile = "test-iac-terraform-ci"
aws_region_bucket_remote_state = "clouddemo-lumi-starix-tf-goldfish"
aws_region_key_remote_state    = "env:/testlab/lumi-eks-tf.tfstate"
allow_whitelist = ["202.78.231.32/27","120.72.109.32/29","120.72.83.128/29"]

###############
namespaces = ["haproxy","sample","nexops","nap","alpha"]
###############
admin_users     = ["troy.vo","dennis.le","ken.test", "troy.test"] #, "troy.vo"
developer_users = ["dev1", "dev2"]

############### spot_termination
spot_termination_handler_chart_name      = "aws-node-termination-handler"
spot_termination_handler_chart_repo      = "https://aws.github.io/eks-charts"
spot_termination_handler_chart_version   = "0.21.0"
spot_termination_handler_chart_namespace = "kube-system"

############## LB & Ingress
lb_az_cross = "true"
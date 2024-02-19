# Define Local Values in Terraform
locals {
  project     = var.project
  team        = var.team
  environment = var.environment
  common_tags = {
    Dept         = "VNTeam"
    Team         = local.team
    ManageBy     = "vnTerraform"
    Environment  = upper(local.environment)
    map-migrated = "migQK0IMQ5LFK"
  }
}

data "aws_ami" "os" {
  for_each = local.allowed_os

  most_recent = true
  owners      = [each.value.owner]
  filter {
    name   = "name"
    values = [each.value.filter]
  }
}

locals {
  allowed_os = {
    "amazon" : { owner : "amazon", filter : "amzn2-ami-hvm*" },
    "suse" : { owner : "amazon", filter : "*suse*" },
    "RHEL" : { owner : "amazon", filter : "*RHEL*" },
    "ubuntu20" : { owner : "amazon", filter : "*ubuntu-focal-20.04-amd64-server-20230328" },
    "ubuntu22" : { owner : "amazon", filter : "*ubuntu-jammy-22.04-amd64-server-20230728" },
    "windows2019" : { owner : "amazon", filter : "Windows_Server-2019-English-Full-Base*" },
    "windows2022" : { owner : "amazon", filter : "Windows_Server-2022-English-Full-Base*" },
  }
  ##  
  liniux_serverconfig = [
    for srv in var.linux_vm : {
      instance_name = "${srv.application_name}" #-${i}
      instance_type = srv.instance_type
      volume_type   = srv.volume_type
      volume_size   = srv.volume_size
      ami           = srv.ami
    }
  ]
  windows_serverconfig = [
    for srv in var.windows_vm : {
      instance_name = "${srv.application_name}" #-${i}
      instance_type = srv.instance_type
      volume_type   = srv.volume_type
      volume_size   = srv.volume_size
      ami           = srv.ami
    }
  ]
}
// We need to Flatten it before using it
locals {
  linux_instances   = flatten(local.liniux_serverconfig)
  windows_instances = flatten(local.windows_serverconfig)
}
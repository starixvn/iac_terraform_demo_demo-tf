module "public_bastion_linux" {
  source                 = "gitlab.nexdev.net/iac-terraform/ec2-instance/aws"
  version                = "5.1.0"
  for_each               = { for server in local.linux_instances : server.instance_name => server }
  instance_type          = each.value.instance_type
  name                   = lower("vn-${var.team}-${var.environment}-${each.key}")
  ami                    = data.aws_ami.os[each.value.ami].id
  subnet_id              = data.terraform_remote_state.vpc.outputs.public_subnets[0]
  vpc_security_group_ids = [module.public_bastion_linux_sg.security_group_id]
  root_block_device = [{
    volume_type           = each.value.volume_type
    volume_size           = each.value.volume_size
    delete_on_termination = false
  }]
  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 8
  }
  user_data = file("${path.module}/linux_prepare.sh")
  tags = merge(
    local.common_tags,
    {
      Resource = "stopoutofworking"
    },
  )
}
/*
module "public_bastion_windows" {
  source = "gitlab.nexdev.net/iac-terraform/ec2-instance/aws"
  version = "5.1.0"
  for_each = {for server in local.windows_instances: server.instance_name =>  server}
  instance_type = each.value.instance_type
  name = "${local.project}-${each.key}"
  ami           = data.aws_ami.os[each.value.ami].id
  subnet_id              = data.terraform_remote_state.vpc.outputs.public_subnets[0]
  vpc_security_group_ids = [module.public_bastion_windows_sg.security_group_id]
  associate_public_ip_address = true
  root_block_device = [{
  volume_type = each.value.volume_type
  volume_size = each.value.volume_size
  delete_on_termination = true
  }]
  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 8
  }
  user_data     = <<EOF
<powershell>
net user ${var.INSTANCE_USERNAME} '${var.INSTANCE_PASSWORD}' /add /y
net localgroup administrators ${var.INSTANCE_USERNAME} /add

winrm quickconfig -q
winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="300"}'
winrm set winrm/config '@{MaxTimeoutms="1800000"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'

netsh advfirewall firewall add rule name="WinRM 5985" protocol=TCP dir=in localport=5985 action=allow
netsh advfirewall firewall add rule name="WinRM 5986" protocol=TCP dir=in localport=5986 action=allow

net stop winrm
sc.exe config winrm start=auto
net start winrm
</powershell>
EOF
  tags = local.common_tags
}
*/

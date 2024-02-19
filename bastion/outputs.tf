output "public_bastion_sg" {
  value = {
    public_bastion_linux_sg   = module.public_bastion_linux_sg.security_group_id
    public_bastion_windows_sg = module.public_bastion_windows_sg.security_group_id
  }
}

output "public_bastion_testing" {
  value = module.public_bastion_linux
}

output "public_aws_eip" {
  value = aws_eip.public_bastion_linux_eip.id
}
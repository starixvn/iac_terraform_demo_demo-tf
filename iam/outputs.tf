output "ec2_iam_name" {
  description = "iam_instance_profile"
  value       = module.iam_assumable_role_custom_trust_policy_v1.iam_instance_profile_name
}

/*
output "cloud_watch_iam_name" {
  description = "cloud_watch_iam_name"
  value       = module.iam_assumable_role_cloud_watch_trust_policy.iam_instance_profile_name
}
*/
output "cloud_watch_iam_role_arn" {
  description = "iam_policy_cloud_watch"
  value       = module.iam_policy_cloud_watch_v1.arn
}


#policy_arn

#iam_role_arn
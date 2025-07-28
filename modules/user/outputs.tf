# modules\user\outputs.tf


output "user_created" {
    description = "Indicates the user was created"
    value       = null_resource.create_user.id
}
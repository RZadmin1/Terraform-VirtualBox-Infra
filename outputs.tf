# outputs.tf (ROOT)


output "users_created" {
  description = "Map of created user IDs from each module instance"
  value = {
    for user, mod in module.create_users :
    user => mod.user_created
  }
}


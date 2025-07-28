# main.tf (ROOT)


terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

module "create_users" {
    for_each = var.users

    source           = "./modules/user"
    host             = var.host
    port             = var.port
    user             = var.user
    private_key_path = var.private_key_path

    username         = each.value.username
    ssh_public_key   = file(each.value.ssh_public_key)
}


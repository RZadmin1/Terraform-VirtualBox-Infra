# main.tf (ROOT)


terraform {
    required_providers {
        virtualbox = {
            source  = "terra-farm/virtualbox"
            version = "0.2.2-alpha.1"
        }
        null = {
            source  = "hashicorp/null"
            version = "~> 3.0"
        }
    }
}

module "vm" {
    source         = "./modules/vm"
    vm_name        = "steampunk-dev"
    vm_image_path  = var.vm_image_path
    vm_cpus        = var.vm_cpus
    vm_memory      = var.vm_memory
}


module "create_users" {
    source           = "./modules/user"
    for_each = { for user in var.users : user.username => user }
    
    host             = var.host
    port             = var.port
    user             = var.user
    private_key_path = var.private_key_path

    username         = each.value.username
    ssh_public_key   = file(each.value.ssh_public_key)
}


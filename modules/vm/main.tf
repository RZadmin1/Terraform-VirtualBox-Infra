# modules\vm\main.tf


terraform {
    required_providers {
        virtualbox = {
            source  = "terra-farm/virtualbox"
        }
    }
}


resource "virtualbox_vm" "ubuntu" {
    name   = var.vm_name
    image  = var.vm_image_path
    cpus   = var.vm_cpus
    memory = var.vm_memory

    network_adapter {
        type = "nat"
    }
}

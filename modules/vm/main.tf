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


resource "null_resource" "provision_app" {
    depends_on = [virtualbox_vm.ubuntu]

    connection {
        type        = "ssh"
        host        = "127.0.0.1"
        user        = "vagrant"
        port        = 2222
        private_key = file("${path.module}/../../.vagrant/machines/default/virtualbox/private_key")
    }

    provisioner "remote-exec" {
        inline = [
            "sudo apt-get update",
            "sudo apt-get install -y nginx" # Installs NGINX as an example
        ]
    }
}

# modules\vm\outputs.tf

output "vm_name" {
    value = virtualbox_vm.ubuntu.name
}

output "ssh_port" {
    value = 2222
}

output "ssh_user" {
    value = "vagrant"
}

output "private_key_path" {
    value = pathexpand("~/.ssh/id_rsa")
}
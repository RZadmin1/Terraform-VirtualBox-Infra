# modules\user\main.tf


resource "null_resource" "create_user" {
    provisioner "remote-exec" {
        inline = [
            # Create the user if not already present
            "if ! id '${var.username}' 2>/dev/null; then sudo useradd -m ${var.username}; fi",

            # Ensure home dir and .ssh directory
            "sudo mkdir -p /home/${var.username}/.ssh",
            "sudo chown ${var.username}:${var.username} /home/${var.username}/.ssh",
            "sudo chmod 700 /home/${var.username}/.ssh",

            # Write SSH public key
            "echo '${var.ssh_public_key}' | sudo tee /home/${var.username}/.ssh/authorized_keys",
            "sudo chown ${var.username}:${var.username} /home/${var.username}/.ssh/authorized_keys",
            "sudo chmod 600 /home/${var.username}/.ssh/authorized_keys"
        ]
    }

    connection {
        type        = "ssh"
        host        = var.host
        port        = var.port
        user        = var.user
        private_key = file(var.private_key_path)
    }
}

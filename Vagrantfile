# Vagrantfile


Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"  # Ubuntu 18.04
    config.vm.hostname = "terraform-demo"
    # config.vm.network "private_network", type: "dhcp"
    config.vm.network "private_network", ip: "192.168.56.10"

    config.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = 2
    end

    # Share project folder with the VM
    config.vm.synced_folder ".", "/vagrant"

    # Optional: run a provisioning script
    config.vm.provision "shell", path: "scripts/provision.sh"
end

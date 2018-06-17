# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/xenial64"
    config.vm.box_check_update = true

    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.synced_folder "./skeleton", "/vagrant"

    config.vm.synced_folder "./skeleton/var", "/vagrant/var",
        :owner => 'vagrant',
        :group => 'www-data',
        :mount_options => ["dmode=775","fmode=666"]

    config.vm.provision "shell", inline: "sudo apt-get update"
    config.vm.provision "shell", inline: "sudo apt-get upgrade -y"
    config.vm.provision "shell", inline: "sudo apt-get autoremove -y"
    config.vm.provision "shell", inline: "sudo apt-get dist-upgrade -y"
    config.vm.provision "shell", inline: "sudo apt-add-repository ppa:ondrej/php"
    config.vm.provision "shell", inline: "sudo apt-get update"
    config.vm.provision "ansible" do |ansible|
	ansible.extra_vars = { ansible_python_interpreter: "/usr/bin/python3" }
        ansible.playbook = "create_sf_project/create_server.yml"
    end

    config.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
    end
end

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.box_check_update = true

    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.synced_folder "./", "/vagrant"

    config.vm.synced_folder "./var", "/vagrant/var",
        :owner => 'vagrant',
        :group => 'www-data',
        :mount_options => ["dmode=775","fmode=666"]

    config.vm.provision "shell", inline: "sudo apt-get update -y"
    config.vm.provision "shell", inline: "sudo apt-get install python-software-properties -y"
    config.vm.provision "shell", inline: "sudo add-apt-repository ppa:ondrej/php -y"

    config.vm.provision "shell", inline: "sudo apt-get update -y"
    config.vm.provision "shell", inline: "sudo apt-get upgrade -y"
    config.vm.provision "shell", inline: "sudo apt-get autoremove -y"
    config.vm.provision "shell", inline: "sudo apt-get dist-upgrade -y"

    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "ansible/create_server.yml"
    end

    config.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
    end
end

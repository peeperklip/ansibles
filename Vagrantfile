# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/xenial64"
    config.vm.box_check_update = true

    config.vm.network "private_network", ip: "192.168.33.10"

    config.vm.provision "shell", inline: "sudo apt-get update"
    config.vm.provision "shell", inline: "sudo apt-get upgrade -y"
    config.vm.provision "shell", inline: "sudo apt-get autoremove -y"
    config.vm.provision "shell", inline: "sudo apt-get dist-upgrade -y"
    config.vm.provision "shell", inline: "sudo apt-add-repository ppa:ondrej/php"
    config.vm.provision "shell", inline: "sudo apt-get update"

    config.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
    end
end

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/focal64"
    config.vm.box_check_update = true

    config.vm.network "private_network", ip: "192.168.33.10"

    config.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
    end
end

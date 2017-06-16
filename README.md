# Set up a basic web server for Symfony 3
My Vagrant file + Ansible scripts to setup a web server with Nginx and PHP 7.1

###Setup
* Make sure vagrant and ansible are installed
* Add vagrant/.vagrant/ to the .gitignore
* Get the scripts, add the vagrant box and start vagrant:
```sh
$ git submodule add git@github.com:peeperklip/setupSymfony3.git vagrant
$ vagrant box add ubuntu/trusty64
$ cd vagrant
$ vagrant up
```
* Add this line to the host file of the host machine:
```
192.168.33.10 vagrant.dev
```
You should now be able to access the Symfony app by going to `http://vagrant.dev` on the host machine

You can also copy the contents of the vagrant directory to the
project root and modify the Vagrantfile to have the synced folders be `"./"` and `"./var"`.
Just make sure you get rid of the `vagrant/.vagrant/` directory first. This way you can run vagrant simply by doing:
```sh
$ vagrant up
```
instead of:
```sh
$ cd vagrant
$ vagrant up
$ cd ..
```

### Included packages
* nginx
* php7.1-fpm
* php7.1-mysql
* php7.1-xml
* php7.1-cli
* mysql-server

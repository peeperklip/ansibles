# Set up a basic web server for Symfony 3
My Vagrant file + Ansible scripts to setup a web server with Nginx and PHP 7.1

### Setup
* Make sure vagrant and ansible are installed
* Add .vagrant/ to the .gitignore of your project
* Download this project als .ZIP
* Extract said .ZIP in your project
* Add this line to the host file of the host machine:
```
192.168.33.10 vagrant.dev
```
Make sure the Vagrantfile and ansible directory are in the root of the project.
Now all you have to do is to `vagrant up` in the terminal.
You should now be able to access the Symfony app by going to `http://vagrant.dev` on the host machine


### Included packages
* nginx
* php7.1-fpm
* php7.1-mysql
* php7.1-xml
* php7.1-cli
* mysql-server

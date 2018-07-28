# Set up a basic web server for Symfony 4
My Vagrant file + Ansible scripts to setup a web server with Nginx and PHP 7.2

### Setup
* Make sure vagrant and ansible are installed
* Add .vagrant/ to the .gitignore of your project
* Download this project as .ZIP
* Extract said .ZIP somewhere outside of your project
* Copy the contents of ansible-master into your project. 
* Add this line to the host file of the host machine:
```
192.168.33.10 vagrant.local
```
Make sure the Vagrantfile and ansible directory are in the root of the project.
Now all you have to do is to `vagrant up` in the terminal.
You should now be able to access the Symfony app by going to `http://vagrant.local` on the host machine or simply visit the above mentioned ip address.

Ubuntu 16.04 (Xenial) is used along with the following packages: 
* nginx
* php7.2-fpm
* php7.2-mysql
* php7.2-xml
* php7.2-cli
* mysql-server

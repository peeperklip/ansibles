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
You should now be able to access the Symfony app by going to `vagrant.local` on the host machine or simply visit the above mentioned ip address.

Ubuntu 16.04 (Xenial) is used along with the following packages: 
* nginx
* php7.2-fpm
* php7.2-mysql
* php7.2-xml
* php7.2-cli
* mysql-server

# Usage
## Bring the vagrant vm up by doing:
```bash
Vagrant up
```
## Try to ssh into the vagrant box using the following command:
```bash
ssh vagrant@127.0.0.1 -p 2222 -i ssh vagrant@127.0.0.1 -p 2222 -i .vagrant/machines/default/virtualbox/private_key
```

## Troubleshooting:
When doing: `ssh vagrant@127.0.0.1 -p 2222 -i ssh vagrant@127.0.0.1 -p 2222 -i .vagrant/machines/default/virtualbox/private_key`
You could get an error that looks like:
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ECDSA key sent by the remote host is
SHA256:**.
Please contact your system administrator.
Add correct host key in **/known_hosts to get rid of this message.
Offending ECDSA key in **/known_hosts:1
ECDSA host key for [127.0.0.1]:2222 has changed and you have requested strict checking.
Host key verification failed.

To fix this you could:
```bash
nano ~/.ssh/known_hosts
```
Find the line that says: [127.0.0.1]:2222 and remove it. This line starts with [127.0.0.1]:2222 and ends with an equal sign "="

Ping to make sure that Ansible can connect
```bash
ansible vagrant -m ping -i inv_file
```
The desired outcome of this command is:
```
vagrant_box | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```
for a complete set of ansible arguments see: https://docs.ansible.com/ansible/devel/user_guide/intro_inventory.html#list-of-behavioral-inventory-parameters

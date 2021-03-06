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
- Nginx
- Php7.2-fpm
- Php7.2-mysql
- Php7.2-xml
- Php7.2-cli
- Php-sqlite3
- Php7.2-mbstring
- Mysql-server
- Zip
- Unzip
- Php7.2-zip
- Php-curl
- Php7.2-intl
- Php7.2-apcu

# Usage
## Bring the vagrant vm up by doing:
```bash
Vagrant up
```
## Try to ssh into the vagrant box using the following command:
```bash
vagrant ssh
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

Wrong ssh paramters
If you run into this Ansible error: `fatal: [vagrant_box]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh...`
See if you can run `vagrant ssh` if this works, run `vagrant ssh-config` and modify the inventory/inv_file to be inline with the output of that command

Ping to make sure that Ansible can connect
```bash
ansible vagrant -m ping -i inventory/inv_file
```
The desired outcome of this command is:
```
vagrant_box | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```
for a complete set of ansible arguments see: https://docs.ansible.com/ansible/devel/user_guide/intro_inventory.html#list-of-behavioral-inventory-parameters

# To run an Ansible playbook:
```bash
ansible-playbook -i inventory/inv_file path_to_playbook.yml
```
# Available playbooks:
* playbooks/update_packages.yml to update the packages
* playbooks/create_server.yml To create a web server (needs to be ran after create packages)
* playbooks/deploy_symfony.yml (make sure that `deploy_path` variable is defined. Example in `inventory/inv_file`)
I'd suggest running the playbooks in this order because it might end up causing weird issues otherwise.
Restart the web server when doing this
# Restarting nginx/apache
```bash
ansible webservers -i ./inventory/inv_file  -m service -a "name=nginx state=restarted" --become
ansible webservers -i ./inventory/inv_file  -m service -a "name=apache state=restarted" --become
```

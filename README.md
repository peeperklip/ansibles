# Set up a web server
<b>WIP. Do not rely on this on prod servers </b>

## Setup
### Fetching the raw project files
```shell
curl https://raw.githubusercontent.com/peeperklip/ansibles/master/bin/setup.sh | bash
```

### Clone of the project files
```shell
git@github.com:peeperklip/ansibles.git
```
### Fork on GitHub
In case you want to contribute commits
* Create a fork on GitHub
* Clone your fork locally

## Documentation
### Playbooks:
* playbooks/apt_upgrade.yml
    * Used for the basic system maintenance
* playbooks/create_webserver.yml
    * sets up an NGINX or Apache2 webserver
* playbooks/demo_file.yml
    * deploys a symfony demo project (Will be deleted in the near future)

### Roles:
most roles will have their actions prefixed in their name with what they do en end with

### Misc:
* inventory/inventory.dist is an example inventory file meant to be copied and filled in
* inventory/vagrant_demo_inventory is used if you're testing these files using vagrant

### Available playbooks:
- Unzip
- Php7.4-cli
- Php7.4-intl
- Php-sqlite3
- Php7.4-xml
- Mysql-server
- Php7.4-mbstring
- Zip
- Nginx
- Php-curl
- Php7.4-zip
- Php7.4-fpm
- Php7.4-apcu
- Php7.4-mysql


## Testing & development using vagrant
### Interesting to note
If you are working locally using vagrant, you need to add the line below to `/etc/hosts`
```
192.168.33.10 vagrant.local
```
The default box expected is ubuntu 20.04

### Executing on Vagrant
```bash
# needless to say: vagrant needs to be up
vagrant up
```
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

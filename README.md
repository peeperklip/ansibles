# Set up a web server
My Vagrant file + Ansible files

## Setup
```shell
curl https://raw.githubusercontent.com/peeperklip/ansibles/master/bin/setup.sh | bash
```

## Documentation
### Playbooks:
* ...

### Roles:
* ...

### Misc:
* ...

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
The box required is: ubuntu 20.04

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

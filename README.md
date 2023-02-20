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
* playbooks/apt_upgrade.yml
    * Used for the basic system maintenance




### Misc:
* inventory/inventory.dist is an example inventory file meant to be copied and filled in
* inventory/vagrant_demo_inventory is used if you're testing these files using vagrant



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

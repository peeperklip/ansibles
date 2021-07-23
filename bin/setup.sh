#!/bin/bash
if ! type ansible &> /dev/null
then
    echo "ansible could not be found."
    exit
fi

if ! type ansible-playbook &> /dev/null
then
    echo "ansible-playbook could not be found."
    exit
fi

if ! type vagrant &> /dev/null
then
    echo "Vagrant is not installed. Installing will continue but you will not be able to test according to documentation"
    exit
fi

if [ $(ls -A 2>/dev/null | wc -l) -gt 0 ]
then
   echo "Empty directory is required"
   exit
fi

echo "installing!"

wget https://github.com/peeperklip/ansibles/archive/master.zip
unzip master.zip
rm master.zip
rm ansibles-master/README.md
rm ansibles-master/.gitignore
mv ansibles-master/* .
rmdir ansibles-master

echo "Done."

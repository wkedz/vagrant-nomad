#!/bin/bash

echo "Host script"
ls tmp
if [ -a tmp/vagrant_manager_id_key.pub ] ; then
    echo "Setup already done, nothing to do."
else
    echo "Setup..."

    # Make buffor files for symboli links
    touch tmp/ansible_hosts
    touch tmp/authorized_keys
    touch tmp/config

    # Generate key
    ssh-keygen -t rsa -C vagrant@manager -f tmp/vagrant_manager_id_key -N ""

    # Change user of tmp
    chown 1000:1000 tmp/*
fi

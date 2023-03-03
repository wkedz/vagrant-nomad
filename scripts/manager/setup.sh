#!/bin/bash

echo "Manager"

# Add ansible repo
sudo apt-add-repository --yes --update ppa:ansible/ansible

# Install ansible
sudo apt-get install -y ansible

# Make symbolic link to created ansible_host from tmp
sudo rm /etc/ansible/hosts
sudo ln -s /vagrant/tmp/ansible_hosts /etc/ansible/hosts

# Make symboli lint to created ssh config file from tmp
mkdir -p /home/vagrant/.ssh | true
ln -s /vagrant/tmp/config /home/vagrant/.ssh/config

# Move keys to .ssh
mv /vagrant/tmp/vagrant_manager_id_key /home/vagrant/.ssh/vagrant_manager_id_key
cp /vagrant/tmp/vagrant_manager_id_key.pub /home/vagrant/.ssh/vagrant_manager_id_key.pub
cat /vagrant/tmp/vagrant_manager_id_key.pub >> /vagrant/tmp/authorized_keys 

# Set permission to key
chmod 600 /home/vagrant/.ssh/vagrant_manager_id_key

# Use it as main keys
ln -s /home/vagrant/.ssh/vagrant_manager_id_key /home/vagrant/.ssh/id_rsa
ln -s /home/vagrant/.ssh/vagrant_manager_id_key.pub /home/vagrant/.ssh/id_rsa.pub
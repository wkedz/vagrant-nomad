#!/bin/bash

# Add vagrant user to group
sudo usermod -aG consul vagrant

# Save old config and move new one
sudo mv /etc/consul.d/consul.hcl /etc/consul.d/consul.org.hcl || echo $?
sudo cp consul.hcl /etc/consul.d/consul.hcl || echo $?
sudo chown consul:consul /etc/consul.d/consul.hcl || echo $?

# Create consul data dir
sudo mkdir -p /opt/consul || echo $?
sudo chmod 775 /opt/consul || echo $?

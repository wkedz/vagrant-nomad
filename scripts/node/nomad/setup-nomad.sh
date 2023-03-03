#!/bin/bash

# Add vagrant user to group
sudo usermod -aG nomad  vagrant
sudo usermod -aG docker vagrant

# Save old config and move new one
sudo mv /etc/nomad.d/nomad.hcl /etc/nomad.d/nomad.org.hcl || echo $?
sudo cp nomad.hcl /etc/nomad.d/nomad.hcl || echo $?
sudo chown nomad:nomad /etc/nomad.d/nomad.hcl || echo $?

# Create nomad data dir
sudo mkdir -p /opt/nomad || echo $?
sudo chmod 775 /opt/nomad || echo $?

# Create nomad directories
sudo mkdir -p /opt/nomad-volumes/grafana || echo $?
sudo mkdir -p /opt/nomad-volumes/databases || echo $?

# Change permission
sudo chmod 775 /opt/nomad-volumes/grafana || echo $?
sudo chmod 775 /opt/nomad-volumes/databases || echo $?

#sudo chgrp 472:472 /opt/nomad-volumes/grafana || echo $?



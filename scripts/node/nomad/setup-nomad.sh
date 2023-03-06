#!/bin/bash

# Add vagrant user to group
sudo usermod -aG nomad  vagrant
sudo usermod -aG docker vagrant


if [ "$(hostname)" == "node1" ]; then
  export HOST_IP=\"192.168.100.111\"
  export TARGET_SERVERS='\"192.168.100.112\", \"192.168.100.113\"'
elif [ "$(hostname)" == "node2" ]; then
  export HOST_IP=\"192.168.100.112\"
  export TARGET_SERVERS='\"192.168.100.113\", \"192.168.100.111\"'
elif [ "$(hostname)" == "node3" ]; then
  export HOST_IP=\"192.168.100.113\"
  export TARGET_SERVERS='\"192.168.100.111\", \"192.168.100.112\"'
else
  exit 1
fi


# Save oild config and move new one
sudo mv /etc/nomad.d/nomad.hcl /etc/nomad.d/nomad.org.hcl || echo $?

sed  s"/SERVERS/${TARGET_SERVERS}/g" nomad.tmp.hcl > nomad.hcl
sed -i s"/IP/${HOST_IP}/g" nomad.hcl 

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



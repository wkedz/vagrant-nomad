# -*-: ruby -*-
# vi: set ft=ruby :
                
Vagrant.configure('2') do |config|
    config.vm.box = "ubuntu/focal64"
    [:up, :provision].each do |cmd|
      config.trigger.before cmd do |trigger|
        trigger.run = {inline: "./scripts/host/setup.sh"}
      end
    end

    (1..3).each do |nr|
      config.vm.define "node#{nr}" do |node|
        HOST = "node#{nr}"
        IP = "192.168.100.11#{nr}"
        PORT = "811#{nr}"
        node.vm.network 'private_network', ip: IP
        node.vm.network 'forwarded_port', id: 'ssh', host: PORT, guest: "22"
        node.vm.hostname = HOST
        node.vm.provision "shell", path: "./scripts/setup.sh", args: [HOST, IP]
        node.vm.provision "shell", path: "./scripts/node/setup.sh"
      end
    end

    config.vm.define "manager" do |node|
      node.vm.network 'private_network', ip: "192.168.100.10"
      node.vm.network 'forwarded_port', id: 'ssh', host: "8121", guest: "22"
      node.vm.hostname = "manager"
      node.vm.provision "shell", path: "./scripts/manager/setup.sh"
    end

    config.vm.provider 'virtualbox' do |vb|
      vb.memory = '2048'
      vb.cpus = 1 
    end

end

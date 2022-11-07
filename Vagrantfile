# -*-: ruby -*-
# vi: set ft=ruby :
                
Vagrant.configure('2') do |config|
    config.vm.box = "ubuntu/focal64"
    
    (1..1).each do |nr|
      config.vm.define "mng#{nr}" do |node|
        node.vm.network 'private_network', ip: "192.168.100.10#{nr}"
        node.vm.network 'forwarded_port', id: 'ssh', host: "810#{nr}", guest: "22"
        node.vm.hostname = "mng#{nr}"

      end
    end

    (1..1).each do |nr|
      config.vm.define "wrk#{nr}" do |node|
        node.vm.network 'private_network', ip: "192.168.100.11#{nr}"
        node.vm.network 'forwarded_port', id: 'ssh', host: "811#{nr}", guest: "22"
        node.vm.hostname = "wrk#{nr}"
      end
    end

    config.vm.define "manager" do |node|
      node.vm.network 'private_network', ip: "192.168.100.10"
      node.vm.network 'forwarded_port', id: 'ssh', host: "8121", guest: "22"
      node.vm.hostname = "manager"
    end
 

    config.vm.provider 'virtualbox' do |vb|
      vb.memory = '2048'
      vb.cpus = 1 
    end

end

# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.define :master1 do |master1_config|
    master1_config.vm.box = "Centos65"
    master1_config.vm.network "private_network", ip:  "192.168.99.111"
    master1_config.vm.host_name = "master1"
    master1_config.vm.provision :puppet do |master1_puppet|
      master1_puppet.manifests_path = "manifests"
      master1_puppet.module_path = "modules"
      master1_puppet.manifest_file = "site.pp"
    end
  end  
  
   config.vm.define :agent1 do |agent1_config|
    agent1_config.vm.box = "Centos65"
    agent1_config.vm.network "private_network", ip:  "192.168.99.112"
    agent1_config.vm.host_name = "agent1"
    agent1_config.vm.provision :puppet do |agent1_puppet|
      agent1_puppet.manifests_path = "manifests"
      agent1_puppet.module_path = "modules"
      agent1_puppet.manifest_file = "site.pp"
    end
  end  
end

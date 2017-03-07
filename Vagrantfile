# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  config.vm.define :mod3 do |mod3|
    mod3.vm.box = "ubuntu/trusty64"
    mod3.vm.hostname = "Moodle3Pablo"
    mod3.vm.network :private_network, ip: "10.1.1.101"
    mod3.vm.network :public_network, ip: "192.168.8.111"
    config.vm.synced_folder "script/", "/home/vagrant"
end
end

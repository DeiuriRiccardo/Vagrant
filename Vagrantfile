# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  BOX_IMAGE = "ubuntu/jammy64"
  BASE_HOST_ONLY_NETWORK = "192.168.56"
  BASE_INT_NETWORK = "10.10.20"
  VMRAM = "1024"
  
  config.vm.define "web" do |webconfig|
    webconfig.vm.box = BOX_IMAGE
	webconfig.vm.hostname = "web-m340"
	
	webconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.10", virtualbox__intnet: true, name: "VirtualBox Int-net Ethernet Adapter"
	webconfig.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK}.10", name: "VirtualBox Host-Only Ethernet Adapter"
  
	webconfig.vm.provision "shell", path: "provision-update.sh"
	webconfig.vm.provision "shell", path: "provision-web.sh"
	
	webconfig.vm.synced_folder "./website", "/var/www/html"
	
	webconfig.vm.provider "virtualbox" do |vb|
		vb.name = "WebVM"
		vb.memory = VMRAM
		vb.cpus = 2
	end
  end

  config.vm.define "db" do |dbconfig|
    dbconfig.vm.box = BOX_IMAGE
	dbconfig.vm.hostname = "db-m340"
	
	dbconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.11", virtualbox__intnet: true, name: "VirtualBox Int-net Ethernet Adapter"
  
	dbconfig.vm.provision "shell", path: "provision-update.sh"
	dbconfig.vm.provision "shell", path: "provision-db.sh"
	
	dbconfig.vm.provider "virtualbox" do |vb|
		vb.name = "DbVM"
		vb.memory = VMRAM
		vb.cpus = 2
	end
  end

end
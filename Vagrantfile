# -*- mode: ruby -*-
# vi: set ft=ruby :

# NOTES:
# * Disable automatic box update checking. If you disable this, then boxes will only be checked for updates when the user runs `vagrant box outdated`. This is not recommended.
# config.vm.box_check_update = false
# * I had a hard time finding a test file to confirm that this virtualbox network could exceed 100mbps on my system. That is to say, I never once saw it exceed that speed.
#   I dont know if the nicspeed commands even do anything.

# TODO - import parameters from environment (processors and memory?)

# IP INFO
# 10.61.54.1 - automatically made by vagrant on your host network
# 10.61.54.2 - default

Vagrant.configure("2") do |vagconf|

	# make a VM for building the waterbox toolchain
	vagconf.vm.define "default" do |vmconf|
		vmconf.vm.box = "bento/debian-9.11"
		vmconf.vm.box_check_update = false
		vmconf.vm.network "private_network", ip: "10.61.54.2"

		vmconf.vm.synced_folder "share", "/share", type: "virtualbox"

		vmconf.vm.provider "virtualbox" do |vb|
			vb.default_nic_type = "virtio"
			vb.memory = 3072
			vb.cpus = 6
			vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
			vb.customize ["storagectl", :id, "--name", "SATA Controller", "--hostiocache", "on"]
			vb.customize ["modifyvm", :id, "--audio", "none"]
			vb.customize ["modifyvm", :id, "--nicspeed1", "100000000"]
			vb.customize ["modifyvm", :id, "--nicspeed2", "100000000"]
			vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
			vb.customize ["modifyvm", :id, "--cableconnected2", "on"]
		end

	vmconf.vm.provision :shell, path: "initvm.sh"

	end


end

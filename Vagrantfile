# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"
  config.vm.provision :shell, :path => "provisioning/bootstrap.sh"

  config.vm.network :forwarded_port, host: 3000, guest: 3000

  config.vm.provider "virtualbox" do |v|
    v.name = "letshelpit_vm"
    v.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
  end
end

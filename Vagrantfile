# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.box = "windows_10_dev"
  
  config.vm.box_url = "file:///Users/hibri/Dropbox/vagrant/windows_10_dev_vmware.box"


  # Admin user name and password
  config.winrm.username = "vagrant"
  config.winrm.password = "vagrant"
  config.vm.boot_timeout = 60

  config.vm.guest = :windows
  config.windows.halt_timeout = 15



   config.vm.communicator = :winrm

   config.vm.synced_folder ".", "/vagrant", disabled: true

  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true

  end
  
  config.vm.provider "vmware_fusion" do |v|
    v.gui = true
    v.vmx["memsize"] = "4096"
    v.vmx["numvcpus"] = "2"
  end

    config.vm.provision "shell", path: "boot.ps1"
  # end

  config.librarian_puppet.puppetfile_dir = "puppet"
  config.vm.provision "puppet" do |puppet|
     puppet.module_path = "puppet/modules"
     puppet.manifests_path = "puppet/manifests"
     puppet.manifest_file = "default.pp"
  end
end

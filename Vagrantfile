# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "windows_2012_r2"
  # config.vm.box_url = "https://www.dropbox.com/s/rcxyts6ik3ybnxu/windows_10_vmware.box?dl=1"
  config.vm.box_url = "file:///Users/hibri/Dropbox/vagrant/windows_2012_r2_virtualbox.box"
  config.vm.communicator = :ssh

  # Admin user name and password
  config.winrm.username = "vagrant"
  config.winrm.password = "vagrant"
  config.vm.boot_timeout = 60

  config.vm.guest = :windows
  config.windows.halt_timeout = 15

  config.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
  config.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true
  config.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", auto_correct: true
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false
   config.vm.communicator = :winrm
   config.ssh.insert_key = false
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
   config.vm.synced_folder ".", "/vagrant", disabled: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
  
    # Customize the amount of memory on the VM:
    # vb.memory = "1024"
  end
  
  # View the documentation for the provider you are using for more
  # information on available options.

  config.vm.provider "vmware_fusion" do |v|
    v.gui = true
  end
  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
    config.vm.provision "shell", path: "boot.ps1"
  # end

  config.librarian_puppet.puppetfile_dir = "puppet"
  config.vm.provision "puppet" do |puppet|
     puppet.module_path = "puppet/modules"
     puppet.manifests_path = "puppet/manifests"
     puppet.manifest_file = "default.pp"
  end
end

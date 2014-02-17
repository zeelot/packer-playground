Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |vb, override|
    override.vm.box = "precise64"
    override.vm.box_url = "http://files.vagrantup.com/precise64.box"
    vb.customize ["modifyvm", :id, "--memory", 2048]
  end

  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.roles_path = "roles"
    chef.data_bags_path = "data_bags"
    chef.encrypted_data_bag_secret_key_path = ".chef/encrypted_data_bag_secret"
    chef.add_role("server-nginx")
  end
end
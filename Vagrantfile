Vagrant.configure("2") do |config|
    config.vm.box = "mysql"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"
    config.vm.network :forwarded_port, guest: 3306, host: 13306
    config.vm.provision :shell, :path => "bootstrap.sh"
end
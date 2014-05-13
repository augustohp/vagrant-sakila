# vim: set ft=ruby ts=4 sw=4:
VAGRANT_API_VERSION = "2";

Vagrant.configure(VAGRANT_API_VERSION) do |config|
    config.vm.box = "precise32"
    config.vm.hostname = "sakila.mysql.localhost"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"

    config.vm.provision "shell", path: "./bin/mysql-install.sh"
end

Vagrant.configure("2") do |config|
  config.vm.box = "cloud-image/ubuntu-26.04"
  config.vm.hostname = "case-study-vm"
  config.vm.boot_timeout = 600
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vm.provision "file", source: "docker-compose.yml", destination: "/home/vagrant/docker-compose.yml"
  config.vm.provision "shell", path: "provision.sh"
end
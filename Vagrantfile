Vagrant.configure(2) do |config|

  config.vm.define "ubuntu1604" do |xenial|
    xenial.vm.box = "ubuntu/xenial64"
    xenial.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
    xenial.vm.provision "shell", inline: <<-SHELL
      sudo su -
      cd /vagrant
      ./run_tests.sh
    SHELL
  end

  config.vm.define "centos7" do |centos7|
    centos7.vm.box = "centos/7"
    centos7.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
    centos7.vm.provision "shell", inline: <<-SHELL
      sudo su -
      cd /vagrant
      ./run_tests.sh
    SHELL
  end

end

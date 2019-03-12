NUM_SLAVES=(ENV['NUM_SLAVES'] || 2).to_i()

SUBNET=(ENV['SUBNET'] || "192.168.33")
IP_BASE=100

MASTER_IP="#{SUBNET}.#{IP_BASE}"

MASTER_MEMORY=(ENV['MASTER_MEMORY'] || 1024).to_i()
NODE_MEMORY=(ENV['NODE_MEMORY'] || 1024).to_i()



Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.6"
  config.vm.provision :shell, path: "bootstrap.sh"



end

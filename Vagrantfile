required_plugins = %w(vagrant-ignition vagrant-vbguest vagrant-disksize)
plugins_to_install = required_plugins.select { |plugin| not Vagrant.has_plugin? plugin }
if not plugins_to_install.empty?
  puts "Installing plugins: #{plugins_to_install.join(' ')}"
  if system "vagrant plugin install #{plugins_to_install.join(' ')}"
    exec "vagrant #{ARGV.join(' ')}"
  else
    abort "Installation of one or more plugins has failed. Aborting."
  end
end




NUM_SLAVES=(ENV['NUM_SLAVES'] || 2).to_i()
SUBNET=(ENV['SUBNET'] || "192.168.33")
IP_BASE=100
MASTER_IP="#{SUBNET}.#{IP_BASE}"
MASTER_MEMORY=(ENV['MASTER_MEMORY'] || 2048).to_i()
NODE_MEMORY=(ENV['NODE_MEMORY'] || 1024).to_i()
SSH_PORT_BASE=5678


Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.6"
  config.vm.provision :shell, path: "bootstrap.sh"
  if Vagrant.has_plugin?("vagrant-disksize")
     config.disksize.size = '20GB'
  end
  
  config.vm.define "k8s.master.com", primary: true do |master|
    master.vm.hostname = 'k8s.master.com'
    master.vm.network :private_network, ip: MASTER_IP
    master.vm.network :forwarded_port, guest: 22, host: SSH_PORT_BASE, id: "ssh"
    master.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", MASTER_MEMORY]
      v.customize ["modifyvm", :id, "--name", "k8s.master.com"]
    end
  end

  (1..NUM_SLAVES).each do |i|
    hostname="k8s.node-#{i}.com"
    config.vm.define hostname do |node|
      node.vm.hostname = hostname
      node.vm.network :private_network, ip: "#{SUBNET}.#{i+IP_BASE}"
      node.vm.network :forwarded_port, guest: 22, host: (SSH_PORT_BASE+i), id: "ssh"
      node.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--memory", NODE_MEMORY]
        v.customize ["modifyvm", :id, "--name", hostname]
      end
    end
  end
 end

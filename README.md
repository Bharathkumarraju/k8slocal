# k8slocal setup
Automated local k8s setup

### Before you start make sure you install below components I am a Mac user ;)
Oracle virtualbox latest version https://download.virtualbox.org/virtualbox/6.0.4/VirtualBox-6.0.4-128413-OSX.dmg
Vagrant Latest version https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_x86_64.dmg

### Install optional plugins
```
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-disksize
```
### Default Settings
```
So I am using subnet as 192.168.33.0/24
and MASTER_IP: 192.168.33.100 
```


### Run Vagrant Boom.........!!!
```
vagrant up
```

#### Graceful restart of VM's
```
vagrant reload --provision
```

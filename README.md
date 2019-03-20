# k8slocal setup
Automated local k8s setup

### Before you start make sure you install below components I am a Mac user ;)
* Oracle virtualbox latest version https://download.virtualbox.org/virtualbox/6.0.4/VirtualBox-6.0.4-128413-OSX.dmg
* Vagrant Latest version https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_x86_64.dmg
* Install ansible using command "pip install ansible" 
  * if you are strugglng to findout pip in windows just have look at here: https://stackoverflow.com/questions/29817447/how-to-run-pip-commands-from-cmd


### Default Settings
```
So I am using subnet as 192.168.33.0/24
and MASTER_IP: 192.168.33.100  and NODE_IPS are 100+1 and so on i.e. 192.168.33.101, 192.168.33.102 etc..
```


### Run Vagrant Boom.........!!!
```
vagrant up
```

### Login to VM boxes
```
vagrant ssh k8s.master.com    and vagrant ssh k8s.node-1.com , vagrant ssh k8s.node-2.com
```

#### Graceful restart of VM's
```
vagrant reload --provision
```

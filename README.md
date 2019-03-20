# k8slocal setup
Automated local k8s setup

### Before you start make sure you install below components I am a Mac user ;)
* Oracle virtualbox latest version https://download.virtualbox.org/virtualbox/6.0.4/VirtualBox-6.0.4-128413-OSX.dmg
* Vagrant Latest version https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_x86_64.dmg
* Install ansible using command ```pip install ansible``` 
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

##### now time to see get nodes by loggining as below
```
bharathumarsAir:k8slocal bharathkumardasararaju$ vagrant ssh k8s.master.com
Last login: Wed Mar 20 14:25:16 2019 from 10.0.2.2
-bash: warning: setlocale: LC_CTYPE: cannot change locale (UTF-8): No such file or directory
[vagrant@k8s ~]$ kubectl get nodes -o wide
NAME             STATUS   ROLES    AGE   VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE                KERNEL-VERSION              CONTAINER-RUNTIME
k8s.master.com   Ready    master   43m   v1.13.4   10.0.2.15     <none>        CentOS Linux 7 (Core)   3.10.0-957.5.1.el7.x86_64   docker://18.9.3
k8s.node-1.com   Ready    <none>   30m   v1.13.4   10.0.2.15     <none>        CentOS Linux 7 (Core)   3.10.0-957.5.1.el7.x86_64   docker://18.9.3
k8s.node-2.com   Ready    <none>   15m   v1.13.4   10.0.2.15     <none>        CentOS Linux 7 (Core)   3.10.0-957.5.1.el7.x86_64   docker://18.9.3
[vagrant@k8s ~]$
```



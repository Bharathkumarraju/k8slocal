#!/usr/bin/env bash
##Script Author: BKR (Cloud & DevOps Enabler :-) ##
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
yum install -y epel-release
yum install -y vim wget ansible

#!/bin/bash

sudo passwd root

su root

mkdir /root/.ssh/

sed -i "s/#AuthorizedKeysFile/AuthorizedKeysFile/" /etc/ssh/sshd_config

echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAzpCcrGHrHSoNAuMpCBNp7fgJjrtvkbYiqKXKeMhvTcSXzhNAhbQEdrCI0W6bZ5PAsB+An2Osrx/I/o5YqJXNnDJqLKJKgYIrcChknXXUnlSD3D46ItoDokqDEGmuubm/yvmcqATqHQaeGepUdZrxnMtDedLotL2BCWIu4s1VFaS67DQ2Li91qmo3tqEGnkl6bEqX4VbJfElYXWw9FhWB+8a/Sk27xSUdS2Lw6RRUiyTpJO0/BKL3+GKtcnsHuVxryl8SKR9y1COV/ccXNdUHdp2SJ3jKjvrJjxomjxNZ6y/4uMEVWQnhocA21L1O2vAHyiHRtrz0w6aaooA4blRKQQ== root@"`hostname` >> /root/.ssh/authorized_keys

apt-get install -y nginx

service ssh restart

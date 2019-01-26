#!/bin/bash -e

#shell script to install and to block test ip 192.168.2.20 using a shell script fail2ban.sh

# created by dhanasekar

# 26-01-2019

#installation of fail2ban
sudo apt install -y fail2ban

#start the fail2ban service
sudo systemctl start fail2ban 

#permanently start fail2ban on system start
sudo systemctl enable fail2ban

#copying the jail.conf to jail.local file
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

#adding default parameters to /etc/fail2ban/jail.local file
sudo echo "[sshd]
enabled = true
port = 22
filter = sshd
logpath = /var/log/auth.log
maxretry = 5" > /etc/fail2ban/jail.local

#command to block a particular ip 
sudo fail2ban-client -vvv set JAIL banip 10.0.3.90

#command to check the jail where to add the IP
sudo fail2ban-client status

#restarting the service
sudo systemctl restart fail2ban

#to unban the ip 10.0.3.90
#sudo fail2ban-client set sshd unbanip 10.0.3.90

#!/bin/bash
echo '############## install KVM ###################'
sudo apt-get install virt-manager
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst virt-manager

sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER

echo '############## install iptables-persistent and net-tools ###################'
sudo apt-get install iptables-persistent
sudo apt install net-tools

echo '############## install docker and docker-compose ###################'
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo '############## install mosquitto (MQTT Server) and setting username and password ###################'
sudo apt update -y && sudo apt install mosquitto mosquitto-clients -y
sudo mosquitto_passwd -c /etc/mosquitto/passwd rcsl

echo '############reboot now################'
sudo reboot now



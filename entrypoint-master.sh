#!/bin/sh


# PUB_KEY=$(awk '{print $1}' ~/.ssh/master.pub)

for node_ip in "192.168.111.3" "192.168.111.4" "192.168.111.5"; do
  sshpass -p "123" ssh -o "StrictHostKeyChecking no" root@$node_ip "mkdir -p ~/.ssh && chmod 700 ~/.ssh"
  sshpass -p "123" ssh-copy-id -i ~/.ssh/master.pub root@$node_ip
  # sshpass -p "123"
done


# eval $(ssh-agent)
# ssh-add ~/.ssh/master

exec /bin/bash

